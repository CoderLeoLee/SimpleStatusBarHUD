//
//  XMGStatusBarHUD.m
//  XMGStatusBarHUD
//
//  Created by Leo on 15/9/21.
//  Copyright (c) 2015年 com.520it. All rights reserved.
//

#import "XMGStatusBarHUD.h"

@implementation XMGStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;
/** HUD控件的高度*/
static CGFloat const XMGWindowH = 20;
/** HUD控件动画的持续时间*/
static CGFloat const XMGAnimationDuration = 0.25;
/** HUD控件默认会停留多长时间*/
static CGFloat const XMGStayDuration = 1.5;


/**
 * 显示图片+文字信息
 */
+ (void)showImageName:(NSString *)imageName text:(NSString *)text{

    [self showImage:[UIImage imageNamed:imageName] text:text];
}

/**
 * 显示图片和文字信息
 */
+ (void)showImage:(UIImage *)image text:(NSString *)text{

    // 停止之前的定时器
    [timer_ invalidate];
    // 创建窗口
    // 隐藏之前的窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = CGRectMake(0, -XMGWindowH, [UIScreen mainScreen].bounds.size.width, XMGWindowH);
    window_.hidden = NO;
    
    // 添加按钮
    UIButton *button = [[UIButton alloc]init];
    button.frame = window_.bounds;
    
    // 给button设置文字和图片
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:13]];
    
    // 设置图片
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    }
    // 添加按钮
    [window_ addSubview:button];
    
    // 添加动画
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = 0;
        window_.frame = frame;
    }];
    
    // 开启一个新的定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)text{

    [self showImageName:@"XMGStatusBarHUD.bundle/success" text:text];
}

/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)text{
    [self showImageName:@"XMGStatusBarHUD.bundle/error" text:text];
}


/**
 * 显示正在加载的信息
 */
+ (void)showLoading:(NSString *)text{

    // 停止之前的定时器
    [timer_ invalidate];
    // 创建窗口
    // 隐藏之前的窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = CGRectMake(0, -XMGWindowH, [UIScreen mainScreen].bounds.size.width, XMGWindowH);
    window_.hidden = NO;
    
    // 添加按钮
    UIButton *button = [[UIButton alloc]init];
    button.frame = window_.bounds;
    
    // 给button设置文字
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:13]];
    
    // 添加菊花
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    loadingView.center = CGPointMake(button.titleLabel.frame.origin.x - 50, XMGWindowH * 0.5);
    [window_ addSubview:loadingView];
    
    
    // 添加按钮
    [window_ addSubview:button];
    
    // 添加动画
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = 0;
        window_.frame = frame;
    }];
    
}

/**
 * 显示普通信息
 */
+ (void)showText:(NSString *)text{
    [self showImageName:nil text:text];
}

/**
 * 显示隐藏
 */
+ (void)hide{

    // 清空定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -XMGWindowH;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
    }];
}


@end
