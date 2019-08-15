//
//  ZJSAlertAnimation.h
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/15.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJSAlertAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL isPresent;

@end

NS_ASSUME_NONNULL_END
