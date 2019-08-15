//
//  ViewController.m
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/14.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import "ViewController.h"

#import "ZJSAlertContentView.h"
#import "ZJSAlertViewController.h"

#import "ZJSAlertView.h"

#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self add1];
//    [self add2];
//    [self add3];
//    
//    self.view.backgroundColor = [UIColor grayColor];
}

- (IBAction)action1:(id)sender {
    
    ZJSAlertAction *action1 = [ZJSAlertAction actionWithTitle:@"title1" style:ZJSAlertActionStyleDefault handler:^(ZJSAlertAction * _Nonnull action) {
        NSLog(@"title1");
    }];
    
    ZJSAlertAction *action2 = [ZJSAlertAction actionWithTitle:@"title2" style:ZJSAlertActionStyleBlue handler:^(ZJSAlertAction * _Nonnull action) {
        NSLog(@"title2");
    }];
    
    ZJSAlertView *alertView = [ZJSAlertView alertViewWithTitle:@"我是标题" message:@"备注内容备注内容备注内容备注内容备注内容备注内容" actions:@[action1, action2]];
    
    [alertView showInView:self.view];
    

    
}


- (IBAction)action2:(id)sender {
    
    ZJSAlertAction *action1 = [ZJSAlertAction actionWithTitle:@"title1" style:ZJSAlertActionStyleDefault handler:^(ZJSAlertAction * _Nonnull action) {
        NSLog(@"title1");
    }];
    
    
    ZJSAlertView *alertView = [ZJSAlertView alertViewWithTitle:@"我是标题" message:@"备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容" actions:@[action1]];
    
    
    [alertView show];
}

- (IBAction)action3:(id)sender {
    
    ZJSAlertAction *action1 = [ZJSAlertAction actionWithTitle:@"title1" style:ZJSAlertActionStyleDefault handler:^(ZJSAlertAction * _Nonnull action) {
        NSLog(@"title1");
    }];
    
    ZJSAlertAction *action2 = [ZJSAlertAction actionWithTitle:@"title2" style:ZJSAlertActionStyleBlue handler:^(ZJSAlertAction * _Nonnull action) {
        NSLog(@"title2");
    }];
    
    ZJSAlertView *alertView = [ZJSAlertView alertViewWithTitle:@"我是标题" message:@"备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容" image:[UIImage imageNamed:@"icon_dorlink_question_mark"] actions:@[action1, action2]];
    
    [alertView show];
}


- (IBAction)action4:(id)sender {
    
    ZJSAlertView *alertView = [ZJSAlertView alertViewWithTitle:@"我是标题" message:@"备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容" image:nil actions:nil];
    
    [alertView show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alertView hidden];
        
    });
}


- (IBAction)action5:(id)sender {
    
    ZJSAlertAction *action1 = [ZJSAlertAction actionWithTitle:@"title1" style:ZJSAlertActionStyleDefault handler:^(ZJSAlertAction * _Nonnull action) {
        NSLog(@"title1");
    }];
    
    ZJSAlertAction *action2 = [ZJSAlertAction actionWithTitle:@"title2" style:ZJSAlertActionStyleBlue handler:^(ZJSAlertAction * _Nonnull action) {
        NSLog(@"title2");
    }];
    
    NSMutableAttributedString *atts = [[NSMutableAttributedString alloc] initWithString:@"备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    [atts addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, 4)];
    
    ZJSAlertView *alertView = [ZJSAlertView alertViewWithTitle:@"我是标题" messageAttributedString:atts image:[UIImage imageNamed:@"icon_dorlink_question_mark"] actions:@[action1, action2]];
    
    [alertView show];
}

- (IBAction)action6:(id)sender {
    
    
    
    ZJSAlertAction *action1 = [ZJSAlertAction actionWithTitle:@"title1" style:ZJSAlertActionStyleDefault handler:^(ZJSAlertAction * _Nonnull action) {
        NSLog(@"title1");
    }];
    
    ZJSAlertAction *action2 = [ZJSAlertAction actionWithTitle:@"title2" style:ZJSAlertActionStyleBlue handler:^(ZJSAlertAction * _Nonnull action) {
        NSLog(@"title2");
    }];
    
    ZJSAlertViewController *alertView = [ZJSAlertViewController alertViewControllerWithTitle:@"我是标题" message:@"备注内容备注内容备注内容备注内容备注内容备注内容" actions:@[action1, action2]];


    [self presentViewController:alertView animated:YES completion:nil];
//    [alertView showInViewController:self];
}
- (IBAction)action7:(id)sender {}
- (IBAction)action8:(id)sender {}

//
//-(void)add1{
//    ZJSAlertAction *action1 = [ZJSAlertAction actionWithTitle:@"title1" style:ZJSAlertActionStyleDefault handler:^(ZJSAlertAction * _Nonnull action) {
//        NSLog(@"title1");
//    }];
//    
//    ZJSAlertAction *action2 = [ZJSAlertAction actionWithTitle:@"title2" style:ZJSAlertActionStyleBlue handler:^(ZJSAlertAction * _Nonnull action) {
//        NSLog(@"title2");
//    }];
//    
//    ZJSAlertContentView *alertView = [ZJSAlertContentView alertContentViewWithTitle:@"我是标题" message:@"备注内容备注内容备注内容备注内容备注内容备注内容" actions:nil];
//    
//    
//    [self.view addSubview:alertView];
//    
//    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.width.equalTo(self.view).offset(-10);
//    }];
//}
//
//-(void)add2{
//    ZJSAlertAction *action1 = [ZJSAlertAction actionWithTitle:@"title1" style:ZJSAlertActionStyleDefault handler:^(ZJSAlertAction * _Nonnull action) {
//        NSLog(@"title1");
//    }];
//    
//    
//    ZJSAlertContentView *alertView = [ZJSAlertContentView alertContentViewWithTitle:@"我是标题" message:@"备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容" actions:@[action1]];
//    
//    
//    [self.view addSubview:alertView];
//    
//    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(80);
//        make.leading.equalTo(self.view).offset(20);
//        make.trailing.equalTo(self.view).offset(-20);
//    }];
//}
//
//-(void)add3{
//    ZJSAlertAction *action1 = [ZJSAlertAction actionWithTitle:@"title1" style:ZJSAlertActionStyleDefault handler:^(ZJSAlertAction * _Nonnull action) {
//        NSLog(@"title1");
//    }];
//    
//    ZJSAlertAction *action2 = [ZJSAlertAction actionWithTitle:@"title2" style:ZJSAlertActionStyleBlue handler:^(ZJSAlertAction * _Nonnull action) {
//        NSLog(@"title2");
//    }];
//    
//    ZJSAlertContentView *alertView = [ZJSAlertContentView alertContentViewWithTitle:@"我是标题" message:@"备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容备注内容" image:[UIImage imageNamed:@"icon_dorlink_question_mark"] actions:@[action1, action2]];
//    
//    
//    [self.view addSubview:alertView];
//    
//    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.view).offset(-80);
//        make.width.equalTo(self.view).offset(-10);
//    }];
//}


@end
