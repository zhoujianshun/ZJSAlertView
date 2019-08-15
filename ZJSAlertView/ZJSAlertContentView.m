//
//  ZJSAlertContentView.m
//  ZJSAlertViewDemo
//
//  Created by 周建顺 on 2019/8/14.
//  Copyright © 2019 周建顺. All rights reserved.
//

#import "ZJSAlertContentView.h"

#import <Masonry/Masonry.h>


#import "ZJSAlertButton.h"

#define k_ZJS_line_width (1 / [UIScreen mainScreen].scale)

#define k_ZJS_line_color [UIColor colorWithRed:204/255.f green:204/255.f blue:204/255.f alpha:1];

@interface ZJSAlertContentView();

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSAttributedString *messageAttributedString;

@property (nonatomic, copy) NSArray<ZJSAlertAction*> *actions;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, strong) UIStackView *mainStackView;

@property (nonatomic, strong) UIStackView *messageStackView;

@property (nonatomic, strong) UIView *buttonsContainer;
@property (nonatomic, strong) UIStackView *buttonsStackView;

@end

@implementation ZJSAlertContentView

+(instancetype)alertContentViewWithTitle:(NSString*)title message:(nullable NSString *)message actions:(NSArray<ZJSAlertAction*>*)actions{
    return [self alertContentViewWithTitle:title message:message image:nil actions:actions];
}

+(instancetype)alertContentViewWithTitle:(NSString*)title message:(nullable NSString *)message image:(UIImage*)image actions:(NSArray<ZJSAlertAction*>*)actions{
    ZJSAlertContentView *instance = [[ZJSAlertContentView alloc] init];
    
    instance->_image = image;
    instance->_title = title;
    instance->_message = message;
    instance->_actions = actions;
    
    [instance setup];
    return instance;
}

+(instancetype)alertContentViewWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString actions:(NSArray<ZJSAlertAction*>*)actions{
    return [self alertContentViewWithTitle:title messageAttributedString:messageAttributedString image:nil actions:actions];
}


+(instancetype)alertContentViewWithTitle:(NSString*)title messageAttributedString:(nullable NSAttributedString *)messageAttributedString image:(UIImage*)image actions:(NSArray<ZJSAlertAction*>*)actions{
    ZJSAlertContentView *instance = [[ZJSAlertContentView alloc] init];
    
    instance->_image = image;
    instance->_title = title;
    instance->_messageAttributedString = messageAttributedString;
    instance->_actions = actions;
    
    [instance setup];
    return instance;
}

-(void)dealloc{
    NSLog(@"ZJSAlertContentView dealloc");
}


#pragma mark - private methods

-(void)setup{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 6;
    self.layer.masksToBounds = YES;
    
    [self addSubview:self.mainStackView];
    [self.mainStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.top.equalTo(self).offset(20);
        make.bottom.equalTo(self);
    }];
    
    /**************设置图片*************************/
    if(self.image){
        [self.messageStackView addArrangedSubview:self.imageView];
        [self updateImageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@45);
            make.height.equalTo(@45);
        }];
    }
    
    /**********设置 title 和 message*****************/
    if(self.title){
        [self.messageStackView addArrangedSubview:self.titleLabel];
        [self updateTitleLabel];
    }
    
    if(self.message||self.messageAttributedString){
        [self.messageStackView addArrangedSubview:self.messageLabel];
        [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.messageStackView).offset(20);
            make.trailing.equalTo(self.messageStackView).offset(-20);
        }];
        [self updateMessageLabel];
    }
    
    [self.mainStackView addArrangedSubview:self.messageStackView];
    
    if (self.actions.count>0) {
        [self setupButtons];
    }else{
        [self.mainStackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mainStackView.superview).offset(-20);
        }];
    }
    
}



-(void)setupButtons{
    /*********设置 按钮*****************/
    
    [self.mainStackView addArrangedSubview:self.buttonsContainer];
    
    __block ZJSAlertButton *pre;
    [self.actions enumerateObjectsUsingBlock:^(ZJSAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx <= 1) {
            ZJSAlertButton *button = [ZJSAlertButton alertButtonWithAction:obj];
            if (idx == 0) {
                [self.buttonsStackView addArrangedSubview:button];
            }else{
                UIView *line = [self createLine];
                [line mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(@(k_ZJS_line_width));
                }];
                [self.buttonsStackView addArrangedSubview:line];
                [self.buttonsStackView addArrangedSubview:button];
            }
            
            if (pre) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(pre);
                }];
            }
            
            pre = button;
            
            [button addTarget:self action:@selector(buttonTappedAction:) forControlEvents:UIControlEventTouchUpInside];
        }else{
            *stop = YES;
        }
        
    }];
}


-(UIView*)createLine{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = k_ZJS_line_color;
    return line;
}


#pragma mark - update UI

-(void)updateTitleLabel{
    self.titleLabel.text = self.title;
}

-(void)updateMessageLabel{
    if (self.messageAttributedString) {
        self.messageLabel.attributedText = self.messageAttributedString;
    }else{
 
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 6; // 调整行间距
        NSAttributedString *atts = [[NSAttributedString alloc] initWithString:self.message attributes:@{NSParagraphStyleAttributeName:paragraphStyle}];
        self.messageLabel.attributedText = atts;
    }
}

-(void)updateImageView{
    self.imageView.image = self.image;
}

#pragma mark - response event

-(void)buttonTappedAction:(ZJSAlertButton*)sender{

    if (sender.alertAction.handler) {
        sender.alertAction.handler(sender.alertAction);
    }
    
    if ([self.delegate respondsToSelector:@selector(alertContentView:buttonTapped:)]) {
        [self.delegate alertContentView:self buttonTapped:sender.alertAction];
    }
}

#pragma mark - getters and setters

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15.f];
        _titleLabel.textColor = [UIColor colorWithRed:34/255.f green:34/255.f blue:34/255.f alpha:1.f];
    }
    return _titleLabel;
}

-(UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.font = [UIFont systemFontOfSize:13.f];
        _messageLabel.textColor = [UIColor colorWithRed:102/255.f green:102/255.f blue:102/255.f alpha:1.f];
        _messageLabel.numberOfLines = 0;
    }
    return _messageLabel;
}
-(UIStackView *)mainStackView{
    if (!_mainStackView) {
        _mainStackView = [[UIStackView alloc] init];
        _mainStackView.axis = UILayoutConstraintAxisVertical;
        _mainStackView.alignment = UIStackViewAlignmentFill;
        _mainStackView.distribution = UIStackViewDistributionFill;
        
        _mainStackView.spacing = 20;
    }
    return _mainStackView;
}

- (UIStackView *)messageStackView{
    if (!_messageStackView) {
        _messageStackView = [[UIStackView alloc] init];
        _messageStackView.axis = UILayoutConstraintAxisVertical;
        _messageStackView.alignment = UIStackViewAlignmentCenter;
        _messageStackView.distribution = UIStackViewDistributionFill;
        _messageStackView.spacing = 16;
    }
    return _messageStackView;
}

-(UIView *)buttonsContainer{
    if (!_buttonsContainer) {
        _buttonsContainer = [[UIView alloc] init];
        
        [_buttonsContainer addSubview:self.buttonsStackView];
        [self.buttonsStackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.buttonsStackView.superview);
            make.height.equalTo(@44);
        }];
        
        
        
        UIView *line = [self createLine];
        [_buttonsContainer addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(line.superview);
            make.top.equalTo(line.superview);
            make.trailing.equalTo(line.superview);
            make.height.equalTo(@(k_ZJS_line_width));
        }];
        
        
        
    }
    return _buttonsContainer;
}

-(UIStackView *)buttonsStackView{
    if (!_buttonsStackView) {
        _buttonsStackView = [[UIStackView alloc] init];
        _buttonsStackView.axis = UILayoutConstraintAxisHorizontal;
        _buttonsStackView.alignment = UIStackViewAlignmentFill;
        _buttonsStackView.distribution = UIStackViewDistributionFill;
        
    }
    return _buttonsStackView;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor redColor];
        
    }
    return _imageView;
}


@end


