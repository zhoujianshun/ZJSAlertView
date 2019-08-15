//
//  ZJSAlertAction.m
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/14.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import "ZJSAlertAction.h"

@implementation ZJSAlertAction

+(instancetype)actionWithTitle:(NSString*)title style:(ZJSAlertActionStyle)style handler:(void (^ __nullable)(ZJSAlertAction *action))handler{
    ZJSAlertAction *action = [[ZJSAlertAction alloc] init];
    action->_title = title;
    action->_style = style;
    action->_handler = handler;
    return action;
}

-(void)dealloc{
    NSLog(@"ZJSAlertAction dealloc");
}

@end
