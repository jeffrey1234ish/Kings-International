//
//  ToOverlayViewAnimator.m
//  Kings International
//
//  Created by Andrei Chan on 26/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "ToOverlayViewAnimator.h"
#import "SchoolMapOverlayViewController.h"
#import "SchoolMapViewController.h"

@implementation ToOverlayViewAnimator

- (NSTimeInterval) transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //add overlay controller view to super view and make it transparent
    SchoolMapOverlayViewController* toViewController = (SchoolMapOverlayViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    SchoolMapViewController* fromViewController = (SchoolMapViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIImageView *imageView = toViewController.imageView;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    CGPoint imageViewPosition = imageView.layer.position;
    CGPoint scrollViewOriginalPosition = toViewController.scrollView.layer.position;
    imageView.layer.position = CGPointMake(imageViewPosition.x, screenHeight+imageView.frame.size.height);
    toViewController.scrollView.layer.position = CGPointMake(scrollViewOriginalPosition.x, screenHeight+(toViewController.scrollView.frame.size.height/2));
    
    toViewController.view.alpha = 0.0;
    
    [transitionContext.containerView addSubview:toViewController.view];
    
   [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
       fromViewController.view.alpha = 0.0;
       toViewController.view.alpha = 1.0;
       imageView.layer.position = imageViewPosition;
       toViewController.scrollView.layer.position = scrollViewOriginalPosition;
   } completion:^(BOOL finished) {
       [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
       fromViewController.view.alpha = 1.0;
   }];
    
}

#pragma helper functions




@end
