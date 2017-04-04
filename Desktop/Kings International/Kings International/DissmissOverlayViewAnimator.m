//
//  DissmissOverlayViewAnimator.m
//  Kings International
//
//  Created by Andrei Chan on 26/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "DissmissOverlayViewAnimator.h"

@implementation DissmissOverlayViewAnimator

- (NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    SchoolMapViewController* toViewController = (SchoolMapViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    SchoolMapOverlayViewController* fromViewController = (SchoolMapOverlayViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    
}

@end
