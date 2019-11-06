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
    else {
        result(FlutterMethodNotImplemented);
    }
}
@end
