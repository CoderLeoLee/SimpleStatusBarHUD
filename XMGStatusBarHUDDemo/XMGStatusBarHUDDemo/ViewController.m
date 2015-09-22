//
//  ViewController.m
//  XMGStatusBarHUD
//
//  Created by Leo on 15/9/21.
//  Copyright (c) 2015年 com.520it. All rights reserved.
//

#import "ViewController.h"
#import "XMGStatusBarHUD.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)success {
    [XMGStatusBarHUD showSuccess:@"成功加载"];
}

- (IBAction)error {
    [XMGStatusBarHUD showError:@"加载失败"];
}

- (IBAction)loading {
    [XMGStatusBarHUD showLoading:@"正在加载..."];
}

- (IBAction)hide {
    [XMGStatusBarHUD hide];
}

- (IBAction)normal {
    [XMGStatusBarHUD showText:@"随便显示什么.."];
}


@end
