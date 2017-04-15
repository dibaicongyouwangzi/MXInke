//
//  MXAdvertiseHandler.h
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXBaseHandler.h"

@interface MXAdvertiseHandler : MXBaseHandler

/**
 * 获取广告信息
 */
+ (void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure;

@end
