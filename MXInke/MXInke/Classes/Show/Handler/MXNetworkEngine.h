//
//  MXNetworkEngine.h
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessfulBlock)(id object);
typedef void(^FailureBlock)(NSError *error);

@interface MXNetworkEngine : NSObject

@property (nonatomic, copy) SuccessfulBlock successfulBlock;
@property (nonatomic, copy) FailureBlock failureBlock;

+ (void)MX_AFJsonGetRequest:(NSString *)urlString success:(SuccessfulBlock)success failure:(FailureBlock)failure;


@end
