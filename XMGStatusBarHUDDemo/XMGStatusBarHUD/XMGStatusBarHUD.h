//
//  XMGStatusBarHUD.h
//  XMGStatusBarHUD
//
//  Created by Leo on 15/9/21.
//  Copyright (c) 2015年 com.520it. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGStatusBarHUD : NSObject

/**
 * 显示图片+文字信息
 */
+ (void)showImageName:(NSString *)imageName text:(NSString *)text;

/**
 * 显示图片和文字信息
 */
+ (void)showImage:(UIImage *)image text:(NSString *)text;

/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)text;

/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)text;

/**
 * 显示正在加载的信息
 */
+ (void)showLoading:(NSString *)text;

/**
 * 显示普通信息
 */
+ (void)showText:(NSString *)text;

/**
 * 显示隐藏
 */
+ (void)hide;




@end
