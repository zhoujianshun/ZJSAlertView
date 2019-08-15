//
//  ZJSAlertButton.m
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/14.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import "ZJSAlertButton.h"

#import "ZJSAlertAction.h"


@interface ZJSAlertButton()

@end

@implementation ZJSAlertButton


+(instancetype)alertButtonWithAction:(ZJSAlertAction*)action{
    ZJSAlertButton *button = [ZJSAlertButton buttonWithType:UIButtonTypeCustom];
    button->_alertAction = action;
    [button setup];
    return button;
}

-(void)dealloc{
    NSLog(@"ZJSAlertButton dealloc");
}

-(void)setup{
    UIColor *titleColor;
    switch (_alertAction.style) {
        case ZJSAlertActionStyleBlue:
        {
            titleColor = [UIColor colorWithRed:72/255.f green:155/255.f blue:255/255.f alpha:1];
        }
            break;
            
        default:
        {
            titleColor = [UIColor colorWithRed:34/255.f green:34/255.f blue:34/255.f alpha:1];
        }
            break;
    }
    
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [self setTitle:self.alertAction.title forState:UIControlStateNormal];
}

@end

