#import "WyjTestPlugin.h"
#import <wyj_test_plugin/wyj_test_plugin-Swift.h>
#import <Flutter/Flutter.h>

@implementation WyjTestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
//  [SwiftWyjTestPlugin registerWithRegistrar:registrar];
    
    // 注意命名要一致 否则不走下面的方法
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"wyj_test_plugin" binaryMessenger:[registrar messenger]];
    
    WyjTestPlugin *plugin = [[WyjTestPlugin alloc] init];
    
    [registrar addMethodCallDelegate:plugin channel:channel];
}

-(void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS sadhfas " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
        return;
    }
    else if ([@"calculateDifferenceSquares" isEqualToString:call.method]) {
        NSNumber *x1 = call.arguments[@"x1"];
        NSNumber *x2 = call.arguments[@"x2"];
        int n1 = x1.intValue;
        int n2 = x2.intValue;
        int s = (n1+n2) * (n1- n2);
        NSString *res = [NSString stringWithFormat:@"%d",s];
        result(res); // 数值类型 目前还不知道如何传

    //else if // 添加一个数字传值 看看
    }
    else if ([@"numberParams" isEqualToString:call.method]) {
        NSNumber *number = call.arguments[@"number"];
        int n = number.intValue + 10;
        result(@(n));
    }
    else if ([@"pluginHomeVC" isEqualToString:call.method]) {
        UIViewController *vc = [[NSClassFromString(@"PluginHomeVC") alloc] init];
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(100, 60, 100, 200);
        view.backgroundColor = [UIColor orangeColor];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [[self getCurrentVC] presentViewController:vc animated:YES completion:nil];
        });
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}

- (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return result;
}
@end
