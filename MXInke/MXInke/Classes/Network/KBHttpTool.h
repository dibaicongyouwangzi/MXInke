//
//  KBHttpTool.h
//  AFN封装
//
//  Created by 迪拜葱油王子 on 2017/3/16.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^KBHttpSuccessBlock)(id json);
typedef void (^KBHttpFailureBlock)(NSError *error);
typedef void (^KBHttpDownloadProgressBlock)(CGFloat progress);
typedef void (^KBHttpUploadProgressBlock)(CGFloat progress);

@interface KBHttpTool : NSObject
/**
 * get网络请求1
 */
+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(KBHttpSuccessBlock)success
            failure:(KBHttpFailureBlock)failure;


/**
 * post网络请求
 */
+ (void)postWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(KBHttpSuccessBlock)success
            failure:(KBHttpFailureBlock)failure;

/**
 * 下载文件
 */
+ (void)downloadWithPath:(NSString *)path
                 success:(KBHttpSuccessBlock)success
                 failure:(KBHttpFailureBlock)failure
                progress:(KBHttpDownloadProgressBlock)progress;

/**
 * 上传图片
 */
+ (void)uploadWithImagePath:(NSString *)path
                     params:(NSDictionary *)params
                  thumbName:(NSString *)imageKey
                      image:(UIImage *)image
                    success:(KBHttpSuccessBlock)success
                    failure:(KBHttpFailureBlock)failure
                   progress:(KBHttpUploadProgressBlock)progress;
@end
