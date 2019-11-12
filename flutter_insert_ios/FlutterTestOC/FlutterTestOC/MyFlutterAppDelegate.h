//
//  FlutterAppDelegate.h
//  FlutterTestOC
//
//  Created by ZSXJ on 2019/11/11.
//  Copyright © 2019 WYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Flutter;


@interface MyFlutterAppDelegate : FlutterAppDelegate <NSCopying, NSMutableCopying>
@property (nonatomic,strong) FlutterEngine *flutterEngine;


+ (MyFlutterAppDelegate *)shareInstance;
+ (void)flutterInit;
@end

