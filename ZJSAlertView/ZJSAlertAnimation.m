//
//  ZJSAlertAnimation.m
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/15.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import "ZJSAlertAnimation.h"

@implementation ZJSAlertAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView* toView = nil;
    UIView* fromView = nil;
    UIView* transView = nil;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    if (_isPresent) {
        transView = toView;
        [[transitionContext containerView] addSubview:toView];
        
        toView.alpha = 0;
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toView.alpha = 1.0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
        
    }else {
        transView = fromView;
        [[transitionContext containerView] insertSubview:toView belowSubview:fromView];

        fromView.alpha = 1;
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromView.alpha = 0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    }
 
    
}
@end

