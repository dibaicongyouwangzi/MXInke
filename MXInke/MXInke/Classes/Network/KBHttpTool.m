//
//  KBHttpTool.m
//  AFN封装
//
//  Created by 迪拜葱油王子 on 2017/3/16.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "KBHttpTool.h"
#import "AFNetworking.h"

static NSString *kBaseUrl = SERVER_HOST;

@interface AFHttpClient : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end

@implementation AFHttpClient
+ (instancetype)sharedClient {
    static AFHttpClient *client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        client = [[AFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl] sessionConfiguration:config];
        // 接收参数类型
        client.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript", @"text/plain", @"image/gif", nil];
        // 设置超时时间
        client.requestSerializer.timeoutInterval = 15;
        // 安全策略
        client.securityPolicy = [AFSecurityPolicy defaultPolicy];
    });
    return client;
}
@end

@implementation KBHttpTool

+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(KBHttpSuccessBlock)success failure:(KBHttpFailureBlock)failure {
    // 获取完整的url路径
    NSString *url = [kBaseUrl stringByAppendingPathComponent:path];
    [[AFHttpClient sharedClient] GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(KBHttpSuccessBlock)success failure:(KBHttpFailureBlock)failure {
    NSString *url = [kBaseUrl stringByAppendingPathComponent:path];
    [[AFHttpClient sharedClient] POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)downloadWithPath:(NSString *)path success:(KBHttpSuccessBlock)success failure:(KBHttpFailureBlock)failure progress:(KBHttpDownloadProgressBlock)progress {
    NSString *urlString = [kBaseUrl stringByAppendingPathComponent:path];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *downloadTask = [[AFHttpClient sharedClient] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress.fractionCompleted);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 获取沙盒cache路径
        NSURL *cacheDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [cacheDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error) {
            failure(error);
        } else {
            success(filePath.path);
        }
    }];
    [downloadTask resume];
}

+ (void)uploadWithImagePath:(NSString *)path params:(NSDictionary *)params thumbName:(NSString *)imageKey image:(UIImage *)image success:(KBHttpSuccessBlock)success failure:(KBHttpFailureBlock)failure progress:(KBHttpUploadProgressBlock)progress {
    NSString *urlString = [kBaseUrl stringByAppendingPathComponent:path];
    NSData *data = UIImagePNGRepresentation(image);
    
    [[AFHttpClient sharedClient] POST:urlString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:imageKey fileName:@"01.png" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
@end
