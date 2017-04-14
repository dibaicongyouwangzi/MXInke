
 //
//  MXLiveHandler.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXLiveHandler.h"
#import "KBHttpTool.h"

@implementation MXLiveHandler

+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    [KBHttpTool getWithPath:API_HotLive params:nil success:^(id json) {
        success(json);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
