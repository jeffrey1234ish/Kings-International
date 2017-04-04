//
//  SchoolMapNavControllerDelegate.m
//  Kings International
//
//  Created by Andrei Chan on 26/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "SchoolMapNavControllerDelegate.h"
#import "ToOverlayViewAnimator.h"
#import "SchoolMapViewController.h"

@interface SchoolMapNavControllerDelegate ()

@property (nonatomic, retain) id<UIViewControllerAnimatedTransitioning> animator;

@end

@implementation SchoolMapNavControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    /*if ([toVC isKindOfClass:[SchoolMapViewController class]]) {
        return [ToOverlayViewAnimator new];
    }*/
    return nil;
}

@end
