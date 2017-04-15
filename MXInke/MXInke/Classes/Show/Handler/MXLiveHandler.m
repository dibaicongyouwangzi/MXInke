
 //
//  MXLiveHandler.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXLiveHandler.h"
#import "KBHttpTool.h"
#import "MXLocationManager.h"
#import "MXLive.h"
#import <MJExtension.h>

@implementation MXLiveHandler

+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    [KBHttpTool getWithPath:API_HotLive params:nil success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}


+ (void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    
    NSDictionary *params = @{@"uid": @"85149891",
                             @"latitude": [MXLocationManager sharedManager].lat,
                             @"longitude": [MXLocationManager sharedManager].lon
                             };
    
    [KBHttpTool getWithPath:API_NearLive params:params success:^(id json) {
        if ([json[@"dm_error"] integerValue]) {
            failure(json);
        } else {
            // 如果返回信息正确
            // 数据解析
            NSArray *lives = [MXLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
