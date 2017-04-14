//
//  MXNetworkEngine.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXNetworkEngine.h"
#import <AFNetworking.h>

@implementation MXNetworkEngine

+ (void)MX_AFJsonGetRequest:(NSString *)urlString success:(SuccessfulBlock)success failure:(FailureBlock)failure {

    NSString * str = [[NSString stringWithFormat:@"%@",urlString]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * dic = @{@"format":@"json"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    [manager GET:str parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"dm_error"] integerValue] != 0) {
            failure(responseObject[@"error_msg"]);
        } else {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}

@end
