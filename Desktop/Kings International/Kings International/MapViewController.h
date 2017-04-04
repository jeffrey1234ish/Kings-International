//
//  MapViewController.h
//  Kings International
//
//  Created by Andrei Chan on 15/10/14.
//  Copyright (c) 2014年 Andrei Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Common.h"
#import "LocationMarkerCreationViewController.h"
#import "LocationMarker.h"

@interface MapViewController : UIViewController <CLLocationManagerDelegate, GMSMapViewDelegate, UIAlertViewDelegate, LocationMarkerCreationDelegate>

@property (nonatomic, retain, readonly) NSMutableArray *locationMarkers;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, getter=isEditing) BOOL editing;

- (IBAction)toggleEdit:(id)sender;
- (IBAction)backToHome:(id)sender;

@end
