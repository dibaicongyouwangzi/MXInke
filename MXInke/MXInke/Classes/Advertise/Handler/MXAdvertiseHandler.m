//
//  MXAdvertiseHandler.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXAdvertiseHandler.h"
#import "KBHttpTool.h"
#import <MJExtension.h>
#import "MXAdvertise.h"

@implementation MXAdvertiseHandler

+ (void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    [KBHttpTool getWithPath:API_Advertise params:nil success:^(id json) {
        if ([json[@"dm_error"] integerValue]) {
            failure(json);
        } else {
            MXAdvertise *advertise = [MXAdvertise mj_objectWithKeyValues:json[@"resources"][0]];
            success(advertise);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}


@end
