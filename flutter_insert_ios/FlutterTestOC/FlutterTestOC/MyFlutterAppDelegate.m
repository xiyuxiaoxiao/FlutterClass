//
//  FlutterAppDelegate.m
//  FlutterTestOC
//
//  Created by ZSXJ on 2019/11/11.
//  Copyright © 2019 WYJ. All rights reserved.
//

#import "MyFlutterAppDelegate.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@implementation MyFlutterAppDelegate

static MyFlutterAppDelegate *_appDelegate;

+ (MyFlutterAppDelegate *)shareInstance {
    if (!_appDelegate) {
        _appDelegate = [[MyFlutterAppDelegate alloc] init];
    }
    return _appDelegate;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (_appDelegate) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _appDelegate = [[MyFlutterAppDelegate alloc] init];
        });
    }
    return _appDelegate;
}

- (id)copyWithZone:(NSZone *)zone {
    return _appDelegate;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    return _appDelegate;
}

+ (void)flutterInit {
    [[MyFlutterAppDelegate shareInstance] flutterInit];
}
- (void)flutterInit {
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"io.flutter" project:nil];
    [self.flutterEngine runWithEntrypoint:nil];
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
}


@end
