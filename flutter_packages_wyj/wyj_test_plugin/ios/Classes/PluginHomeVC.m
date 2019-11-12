//
//  PluginHomeVC.m
//  wyj_test_plugin
//
//  Created by ZSXJ on 2019/11/7.
//

#import "PluginHomeVC.h"

@interface PluginHomeVC ()

@end

@implementation PluginHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(100, 60, 100, 200);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
    button.frame = CGRectMake(100, 300, 80, 40);
    button.backgroundColor = [UIColor cyanColor];
    [button setTitle:@"返回" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
