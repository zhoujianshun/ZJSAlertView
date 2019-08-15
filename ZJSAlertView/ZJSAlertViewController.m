//
//  ZJSAlertViewController.m
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/15.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import "ZJSAlertViewController.h"

#import <Masonry/Masonry.h>
#import "ZJSAlertContentView.h"

#import "ZJSAlertAnimation.h"

#ifndef kCFCoreFoundationVersionNumber_iOS_7_0
#define kCFCoreFoundationVersionNumber_iOS_7_0 847.20
#endif

#ifndef kCFCoreFoundationVersionNumber_iOS_8_0
#define kCFCoreFoundationVersionNumber_iOS_8_0 1129.15
#endif



typedef void (^ZJSCompletionBlock)(BOOL finish);

@interface ZJSAlertViewController ()<ZJSAlertContentViewDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) ZJSAlertContentView *contentView;

@end

@implementation ZJSAlertViewController

+(instancetype)alertViewControllerWithTitle:(NSString*)title message:(nullable NSString *)message actions:(nullable NSArray<ZJSAlertAction*>*)actions{
    
    return [self alertViewControllerWithTitle:title message:message image:nil actions:actions];
}

+(instancetype)alertViewControllerWithTitle:(NSString*)title message:(nullable NSString *)message image:(nullable UIImage*)image actions:(nullable NSArray<ZJSAlertAction*>*)actions{
    ZJSAlertContentView *contentView = [ZJSAlertContentView alertContentViewWithTitle:title message:message image:image actions:actions];
    
    ZJSAlertViewController *alertView = [[ZJSAlertViewController alloc] initWithContentView:contentView];
    return alertView;
}

+(instancetype)alertViewControllerWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString actions:(nullable NSArray<ZJSAlertAction*>*)actions{
    return [self alertViewControllerWithTitle:title messageAttributedString:messageAttributedString image:nil actions:actions];
}

+(instancetype)alertViewControllerWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString image:(nullable UIImage*)image actions:(nullable NSArray<ZJSAlertAction*>*)actions{
    
    ZJSAlertContentView *contentView = [ZJSAlertContentView alertContentViewWithTitle:title messageAttributedString:messageAttributedString image:image actions:actions];
    
    ZJSAlertViewController *alertView = [[ZJSAlertViewController alloc] initWithContentView:contentView];
    return alertView;
    
}

-(void)dealloc{
    NSLog(@"ZJSAlertViewController dealloc");
}

-(instancetype)initWithContentView:(ZJSAlertContentView*)contentView{
    self = [super init];
    if (self) {
        _contentView = contentView;
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self commonSetup];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}



-(void)commonSetup{
     self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];

    
    _contentView.delegate = self;
    
    [self.view addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(2/3.f).priorityHigh();
        make.width.lessThanOrEqualTo(@280);
        make.width.greaterThanOrEqualTo(@255);
    }];
}


#pragma mark - ZJSAlertContentViewDelegate

-(void)alertContentView:(ZJSAlertContentView *)view buttonTapped:(ZJSAlertAction *)action{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    ZJSAlertAnimation* leftPresentAnimation = [[ZJSAlertAnimation alloc] init];
    leftPresentAnimation.isPresent = YES;
    return leftPresentAnimation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    ZJSAlertAnimation* leftPresentAnimation = [[ZJSAlertAnimation alloc] init];
    leftPresentAnimation.isPresent = NO;
    return leftPresentAnimation;
}

@end
