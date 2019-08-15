//
//  ZJSAlertAction.h
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/14.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZJSAlertAction;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZJSAlertActionStyle) {
    ZJSAlertActionStyleDefault,
    ZJSAlertActionStyleBlue,
};

@interface ZJSAlertAction : NSObject

+(instancetype)actionWithTitle:(NSString*)title style:(ZJSAlertActionStyle)style handler:(void (^ __nullable)(ZJSAlertAction *action))handler;

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, assign, readonly) ZJSAlertActionStyle style;
@property (nonatomic, copy, readonly) void (^handler)(ZJSAlertAction *sender);

@end

NS_ASSUME_NONNULL_END
