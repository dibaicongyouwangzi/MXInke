//
//  MXBaseHandler.h
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 处理完成事件
 */
typedef void(^CompleteBlock)();

/**
 * 处理事件成功
 *
 * @param obj 返回数据
 */
typedef void(^SuccessBlock)(id obj);

/**
 * 处理事件失败
 *
 * @param obj 错误信息
 */
typedef void(^FailureBlock)(id obj);


@interface MXBaseHandler : NSObject

@end
