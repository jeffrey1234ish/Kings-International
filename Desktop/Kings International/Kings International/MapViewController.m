//
//  MapViewController.m
//  Kings International
//
//  Created by Andrei Chan on 15/10/14.
//  Copyright (c) 2014年 Andrei Chan. All rights reserved.
//

#import "MapViewController.h"
#import "Common.h"

#define d_Lat 52.3974714
#define d_Long 0.2639884

@implementation MapViewController
{
    CLLocationManager *locationManager;
    CLLocationCoordinate2D lastLocation;
    GMSMapView *mapView;
    AppDelegate *appDelegate;
    NSMutableArray *_locationMarkers;
}

@synthesize locationMarkers = _locationMarkers, backButton, editing;

static CLLocation *location;

#pragma Helper Functions

- (CLLocationCoordinate2D) createLocationWithLatitude:(NSNumber *)latitude Longitude:(NSNumber *)longitude {
    float a = [latitude floatValue];
    float b = [longitude floatValue];
    return CLLocationCoordinate2DMake(a, b);
}

- (NSArray *) fetchForLocationMarkersWithError:(NSError *)error {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"LocationMarker" inManagedObjectContext:appDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    error = nil;
    return [appDelegate.managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

- (void) createMarkerAtLocation:(CLLocationCoordinate2D)location WithName:(NSString *)name {
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(location.latitude, location.longitude);
    marker.snippet = name;
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map = mapView;
    
    [_locationMarkers addObject:marker]; //Add Marker to an array of GMSMarker
}

- (void) setUp {
    
    //viewDidLoad setup
    
    //instance variable setup
    _locationMarkers = [[NSMutableArray alloc] init];
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.title = @"Map";
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:d_Lat
                                                            longitude:d_Long
                                                                 zoom:16];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.delegate = self;
    mapView.settings.myLocationButton = YES;
    mapView.settings.zoomGestures = YES;
    
    self.view = mapView;
    self.editing = NO;
    
    NSError *error;
    NSArray *fetchedLocation = [self fetchForLocationMarkersWithError:error];
    if (error) {
        
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
        int i = 0;
        for (LocationMarker *lM in fetchedLocation) {
            double delayInSeconds = (i * 0.25);
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            NSLog(@"%llu", popTime);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self createMarkerAtLocation:[self createLocationWithLatitude:[lM valueForKey:@"latitude"] Longitude:[lM valueForKey:@"longitude"]] WithName:[lM valueForKey:@"name"]];
            });
            i++;
        }
    }
}

- (BOOL) saveContext:(NSManagedObjectContext *) managedContext {
    NSError *error = nil;
    if (! [managedContext save:&error]) {
        // Uh, oh. An error happened. :(
        return NO;
    } else
        return YES;
}

#pragma View setup

-(void) viewDidLoad {
    
    [self setUp];
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [appDelegate saveContext];
};
#pragma GMSMapViewDelegate

- (void) mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    
    if (self.isEditing) {
        
        lastLocation = coordinate;
        
        [self performSegueWithIdentifier:@"PushLocationCreator" sender:@"Create"];
    }
    
}

- (void) mapView:(GMSMapView *)mapView didBeginDraggingMarker:(GMSMarker *)marker {
    
    if (self.isEditing) {
        
        [self performSegueWithIdentifier:@"PushLocationCreator" sender:@"Edit"];
        
    }
    
}

- (void) mapView:(GMSMapView *)mapView didTapOverlay:(GMSOverlay *)overlay {
    
    
    
}

#pragma Interface Builder Actions

- (IBAction)toggleEdit:(id)sender {
    
    UIBarButtonItem *editButton = (UIBarButtonItem *)sender;
    
    if (self.isEditing) {
        editButton.title = @"Edit";
        
        [UIView animateWithDuration:0.2 animations:^{
            self.title = @"Map";
            [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:134.0/256.0 green:212.0/256.0 blue:208.0/256.0 alpha:1.0]];
            [self.navigationItem setHidesBackButton:NO];
        }];
        
        self.editing = NO;
    } else {
        editButton.title = @"Done";
        [UIView animateWithDuration:0.2 animations:^{
            self.title = @"Editing";
            
            [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:50.0/256.0 green:50.0/256.0 blue:50.0/256.0 alpha:0.7f]];
            
            [self.navigationItem setHidesBackButton:YES];
            
            self.editing = YES;
        }];
    }
    
}

- (IBAction)backToHome:(id)sender {
    
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    location = [locations lastObject];
    
    NSLog(@"NewLocation %f %f", location.coordinate.latitude, location.coordinate.longitude);
}

#pragma UIAlertViewDelegate

/*
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
        {
            
            break;
        }
        
        default:
            break;
    }
    
}
*/
 
#pragma LocationMarkerCreationDelegate

- (void) locationMarkerDidFinishCreatingMarker:(LocationMarkerCreationViewController *)locationMarkerController {
    
    NSString *name = locationMarkerController.textField.text;
    
    if (![name isEqualToString:@""]) {
        
        [LocationMarker insertLocationMarkerWithName:name Longitude:lastLocation.longitude Latitude:lastLocation.latitude inManagedObjectContext:appDelegate.managedObjectContext];
        //inserting the object first, but saving it when the view disappear because it is going to use a lot less resources
        [self createMarkerAtLocation:lastLocation WithName:name];
    }
    
}

#pragma UIStoryBoard

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *senderString = sender;
    NSLog(@"%@", sender);
    if ([segue.identifier isEqualToString:@"PushLocationCreator"]) {
        LocationMarkerCreationViewController *viewController = segue.destinationViewController;
        viewController.delegate = self;
        if ([senderString isEqualToString:@"Create"]) {
            viewController.deleteButton.hidden = YES;
        } else if([senderString isEqualToString:@"Edit"]) {
            viewController.deleteButton.hidden = NO;
        }
    }
}

@end
