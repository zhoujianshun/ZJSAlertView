//
//  ZJSAlertContentView.h
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/14.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZJSAlertAction.h"

@class ZJSAlertContentView;

NS_ASSUME_NONNULL_BEGIN
@protocol ZJSAlertContentViewDelegate <NSObject>

-(void)alertContentView:(ZJSAlertContentView*)view buttonTapped:(ZJSAlertAction*)action;

@end

@interface ZJSAlertContentView : UIView

+(instancetype)alertContentViewWithTitle:(NSString*)title message:(nullable NSString *)message actions:(nullable NSArray<ZJSAlertAction*>*)actions;

+(instancetype)alertContentViewWithTitle:(NSString*)title message:(nullable NSString *)message image:(nullable UIImage*)image actions:(nullable NSArray<ZJSAlertAction*>*)actions;

+(instancetype)alertContentViewWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString actions:(nullable NSArray<ZJSAlertAction*>*)actions;

+(instancetype)alertContentViewWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString image:(nullable UIImage*)image actions:(nullable NSArray<ZJSAlertAction*>*)actions;

@property (nonatomic, weak) id<ZJSAlertContentViewDelegate>  delegate;

@end

NS_ASSUME_NONNULL_END
