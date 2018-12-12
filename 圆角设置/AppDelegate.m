//
//  AppDelegate.m
//  圆角设置
//
//  Created by 处光夫 on 2018/12/7.
//  Copyright © 2018 处光夫. All rights reserved.
//

#import "AppDelegate.h"
#import <SDWebImage/SDImageCache.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    
    return YES;
}

@end
