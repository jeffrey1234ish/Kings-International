//
//  TransitionController.m
//  Kings International
//
//  Created by Andrei Chan on 26/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "TransitionController.h"

@implementation TransitionController

- (id<UIViewControllerAnimatedTransitioning>) animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [ToOverlayViewAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>) animationControllerForDismissedController:(UIViewController *)dismissed {
    //return [DissmissOverlayViewAnimator new];
    return nil;
}

@end
