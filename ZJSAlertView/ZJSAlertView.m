//
//  ZJSAlertView.m
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/15.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import "ZJSAlertView.h"

#import <Masonry/Masonry.h>

#import "ZJSAlertContentView.h"

@interface ZJSAlertView()<ZJSAlertContentViewDelegate>

@property (nonatomic, strong) ZJSAlertContentView *contentView;

@end

@implementation ZJSAlertView

+(instancetype)alertViewWithTitle:(NSString*)title message:(nullable NSString *)message actions:(nullable NSArray<ZJSAlertAction*>*)actions{
    
    return [self alertViewWithTitle:title message:message image:nil actions:actions];
}

+(instancetype)alertViewWithTitle:(NSString*)title message:(nullable NSString *)message image:(nullable UIImage*)image actions:(nullable NSArray<ZJSAlertAction*>*)actions{
    ZJSAlertContentView *contentView = [ZJSAlertContentView alertContentViewWithTitle:title message:message image:image actions:actions];
    
    ZJSAlertView *alertView = [[ZJSAlertView alloc] initWithContentView:contentView];
    return alertView;
}

+(instancetype)alertViewWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString actions:(nullable NSArray<ZJSAlertAction*>*)actions{
    return [self alertViewWithTitle:title messageAttributedString:messageAttributedString image:nil actions:actions];
}

+(instancetype)alertViewWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString image:(nullable UIImage*)image actions:(nullable NSArray<ZJSAlertAction*>*)actions{
    
    ZJSAlertContentView *contentView = [ZJSAlertContentView alertContentViewWithTitle:title messageAttributedString:messageAttributedString image:image actions:actions];
    
    ZJSAlertView *alertView = [[ZJSAlertView alloc] initWithContentView:contentView];
    return alertView;
    
}

-(instancetype)initWithContentView:(ZJSAlertContentView*)contentView{
    self = [super init];
    if (self) {
        _contentView = contentView;
        [self commonInit];
    }
    return self;
}

-(void)dealloc{
    NSLog(@"ZJSAlertView dealloc");
}

//-(instancetype)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self commonInit];
//    }
//    return self;
//}



-(void)commonInit{
    _contentView.delegate = self;
    self.hideMask = NO;
    
    [self addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(self).multipliedBy(2/3.f).priorityHigh();
        make.width.lessThanOrEqualTo(@280);
        make.width.greaterThanOrEqualTo(@255);
    }];
}

-(void)show{
    [self showInView:[UIApplication sharedApplication].keyWindow];
}

-(void)showInView:(UIView*)view{
    self.frame = view.bounds;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [view addSubview:self];
    
    
    
    self.alpha = 0;
    dispatch_block_t animations = ^{
        self.alpha = 1;
    };
    
    // Spring animations are nicer, but only available on iOS 7+
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000 || TARGET_OS_TV
    if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_7_0) {
        [UIView animateWithDuration:0.3 delay:0. usingSpringWithDamping:1.f initialSpringVelocity:0.f options:UIViewAnimationOptionBeginFromCurrentState animations:animations completion:nil];
        return;
    }
#endif
    [UIView animateWithDuration:0.3 delay:0. options:UIViewAnimationOptionBeginFromCurrentState animations:animations completion:nil];
}

-(void)hidden{


    dispatch_block_t animations = ^{
        self.alpha = 0;
    };
    
    // Spring animations are nicer, but only available on iOS 7+
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000 || TARGET_OS_TV
    if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_7_0) {
        [UIView animateWithDuration:0.3 delay:0. usingSpringWithDamping:1.f initialSpringVelocity:0.f options:UIViewAnimationOptionBeginFromCurrentState animations:animations completion:^(BOOL finished) {
            [self done];
        }];
        return;
    }
#endif
    [UIView animateWithDuration:0.3 delay:0. options:UIViewAnimationOptionBeginFromCurrentState animations:animations completion:^(BOOL finished) {
         [self done];
    }];
}

+ (BOOL)hideForView:(UIView *)view{
    ZJSAlertView *alertView = [self alertViewView:view];
    if (alertView != nil) {
        [alertView hidden];
        return YES;
    }
    return NO;
}

+ (ZJSAlertView *)alertViewView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            ZJSAlertView *alertView = (ZJSAlertView *)subview;
            return alertView;
        }
    }
    return nil;
}


-(void)done{
    [self removeFromSuperview];
}

#pragma mark - ZJSAlertContentViewDelegate

-(void)alertContentView:(ZJSAlertContentView *)view buttonTapped:(ZJSAlertAction *)action{
    [self hidden];
}


#pragma mark -

-(void)setHideMask:(BOOL)hideMask{
    _hideMask = hideMask;
    if (_hideMask) {
        self.backgroundColor = [UIColor clearColor];
    }else{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    }
}

@end

