//
//  SchoolMapViewController.h
//  Kings International
//
//  Created by Andrei Chan on 21/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchoolMapOverlayView.h"
#import "SchoolMapView.h"
#import "SchoolMapOverlayViewController.h"
#import "SchoolMapNavControllerDelegate.h"
#import "TransitionController.h"

@interface SchoolMapViewController : UIViewController <UIScrollViewDelegate, SchoolMapOverlayViewDelegate, SchoolMapViewDelegate>

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) SchoolMapView *schoolMapView;
@property (nonatomic, retain) SchoolMapOverlayView *prototypeOverlayView;

@end
