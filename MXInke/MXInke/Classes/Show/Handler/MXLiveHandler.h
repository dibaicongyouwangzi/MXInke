//
//  MXLiveHandler.h
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXBaseHandler.h"

@interface MXLiveHandler : MXBaseHandler

/**
 * 获取热门直播信息
 */
+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure;

/**
 * 获取附近直播信息
 */
+ (void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure;

@end
