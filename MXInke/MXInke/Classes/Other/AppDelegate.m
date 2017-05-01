//
//  AppDelegate.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "AppDelegate.h"
#import "MXTabBarController.h"
#import "MXLocationManager.h"
#import "MXAdvertiseView.h"
#import "MXLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.rootViewController = [[MXLoginViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    [[MXLocationManager sharedManager] getGps:^(NSString *lat, NSString *lon) {
        NSLog(@"%@ %@",lat,lon);

    }];
    
    return YES;
}


@end
