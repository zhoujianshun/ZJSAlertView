//
//  ZJSAlertButton.h
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/14.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJSAlertAction;

NS_ASSUME_NONNULL_BEGIN

@interface ZJSAlertButton : UIButton

@property (nonatomic, strong, readonly) ZJSAlertAction *alertAction;

+(instancetype)alertButtonWithAction:(ZJSAlertAction*)action;

@end

NS_ASSUME_NONNULL_END
