//
//  MXCacheHelper.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/17.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXCacheHelper.h"

#define advertiseImageKey @"adImage"

@implementation MXCacheHelper

+ (NSString *)getAdvertise {
    return [[NSUserDefaults standardUserDefaults] objectForKey:advertiseImageKey];
}

+ (void)setAdvertise:(NSString *)adImage {
    [[NSUserDefaults standardUserDefaults] setObject:adImage forKey:advertiseImageKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

@end
