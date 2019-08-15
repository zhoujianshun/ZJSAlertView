//
//  ZJSAlertViewController.h
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/15.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZJSAlertAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJSAlertViewController : UIViewController

+(instancetype)alertViewControllerWithTitle:(NSString*)title message:(nullable NSString *)message actions:(nullable NSArray<ZJSAlertAction*>*)actions;

+(instancetype)alertViewControllerWithTitle:(NSString*)title message:(nullable NSString *)message image:(nullable UIImage*)image actions:(nullable NSArray<ZJSAlertAction*>*)actions;

+(instancetype)alertViewControllerWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString actions:(nullable NSArray<ZJSAlertAction*>*)actions;

+(instancetype)alertViewControllerWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString image:(nullable UIImage*)image actions:(nullable NSArray<ZJSAlertAction*>*)actions;

@end

NS_ASSUME_NONNULL_END
