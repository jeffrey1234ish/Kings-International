//
//  LocationMarkerCreationViewController.m
//  Kings International
//
//  Created by Andrei Chan on 19/10/2014.
//  Copyright (c) 2014年 Andrei Chan. All rights reserved.
//

#import "LocationMarkerCreationViewController.h"

@implementation LocationMarkerCreationViewController

@synthesize delegate = _delegate, markerChosen = _markerChosen, textField, deleteButton;

- (IBAction) saveClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([_delegate respondsToSelector:@selector(locationMarkerDidFinishCreatingMarker:)])
        [self.delegate locationMarkerDidFinishCreatingMarker:self];
}

- (IBAction) cancelClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction) deleteButtonPresses:(id)sender {
    if (_markerChosen != nil && [_markerChosen isKindOfClass:NSClassFromString(@"LocationMarker")]) {
        if ([_delegate respondsToSelector:@selector(locationMarkerDidDeleteMarker:With:)])
            [_delegate locationMarkerDidDeleteMarker:_markerChosen With:self];
    }
}

@end
