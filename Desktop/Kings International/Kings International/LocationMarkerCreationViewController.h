//
//  LocationMarkerCreationViewController.h
//  Kings International
//
//  Created by Andrei Chan on 19/10/2014.
//  Copyright (c) 2014年 Andrei Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationMarker.h"

@protocol LocationMarkerCreationDelegate;

@interface LocationMarkerCreationViewController : UIViewController {
}

@property (nonatomic, weak) id<LocationMarkerCreationDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) IBOutlet UIButton *deleteButton;
@property (nonatomic ,retain) LocationMarker *markerChosen;

- (IBAction)saveClicked:(id)sender;
- (IBAction)cancelClicked:(id)sender;
- (IBAction)deleteButtonPresses:(id)sender;

@end

@protocol LocationMarkerCreationDelegate <NSObject>

@optional
- (void) locationMarkerDidFinishCreatingMarker:(LocationMarkerCreationViewController *) locationMarkerController;
- (void) locationMarkerDidDeleteMarker:(LocationMarker *) locationMarker With:(LocationMarkerCreationViewController *) locationMarkerController;

@end