//
//  ViewController.m
//  FlutterTestOC
//
//  Created by ZSXJ on 2019/11/11.
//  Copyright © 2019 WYJ. All rights reserved.
//

#import "ViewController.h"
#import "MyFlutterAppDelegate.h"

@import Flutter;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(handleButtonAction)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"弹出指定的路由" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self
               action:@selector(handleButtonAction2)
     forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"弹出根视图" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor blueColor]];
    button2.frame = CGRectMake(80.0, 300.0, 160.0, 40.0);
    [self.view addSubview:button2];
}

- (void)handleButtonAction {
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] init];
    // 不设置下面router的话 则会默认走main函数的初始化页面
    [flutterViewController setInitialRoute:@"path1"];
    [self presentViewController:flutterViewController animated:false completion:nil];
}
- (void)handleButtonAction2 {
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] init];
    [self presentViewController:flutterViewController animated:false completion:nil];
}


@end
