//
//  ZJSAlertView.h
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/15.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJSAlertAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJSAlertView : UIView

@property (nonatomic, assign) BOOL hideMask;

+ (instancetype)alertViewWithTitle:(NSString*)title message:(nullable NSString *)message actions:(nullable NSArray<ZJSAlertAction*>*)actions;

+ (instancetype)alertViewWithTitle:(NSString*)title message:(nullable NSString *)message image:(nullable UIImage*)image actions:(nullable NSArray<ZJSAlertAction*>*)actions;


+(instancetype)alertViewWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString actions:(nullable NSArray<ZJSAlertAction*>*)actions;

+(instancetype)alertViewWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString image:(nullable UIImage*)image actions:(nullable NSArray<ZJSAlertAction*>*)actions;

- (void)show;
- (void)showInView:(UIView*)view;
- (void)hidden;
+ (BOOL)hideForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
