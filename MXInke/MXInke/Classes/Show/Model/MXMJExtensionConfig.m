//
//  MXMJExtensionConfig.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXMJExtensionConfig.h"
#import <MJExtension.h>
#import "MXLive.h"
#import "MXCreator.h"

@implementation MXMJExtensionConfig

+ (void)load {
    
    [MXLive mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID": @"id",
                 };
    }];
    
    [MXCreator mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID": @"id",
                 @"desc": @"description"
                 };
    }];
    
    
    // 驼峰转下划线
    [MXLive mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    [MXCreator mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
}

@end
