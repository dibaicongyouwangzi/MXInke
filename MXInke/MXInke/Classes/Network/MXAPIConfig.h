//
//  MXAPIConfig.h
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXAPIConfig : NSObject

// 信息服务器地址
#define SERVER_HOST @"http://116.211.167.106/api/live/gettop?&gender=1&gps_info=118.782018%2C32.065246&is_new_user=0&lc=0000000000000051&cc=TG0001&cv=IK4.0.10_Iphone&proto=7&idfa=BB90F465-479D-4991-8EC1-CF342F53FCC9&idfv=1BF04D05-1915-4C17-995A-F7232021FA3C&devi=6176249a3dec5afeb67ecb226af1a904fba0c8ae&osversion=ios_10.200000&ua=iPhone8_2&imei=&imsi=&uid=49465752&sid=20XRZfpYCD6iVbZm7aPNZKFI5evri0b9hx4FmcXVErVXyHNUX8i3&conn=wifi&mtid=cdee25ed82dc94db6e8a285e9db98687&mtxid=fcd733f3b2da&logid=202&count=5&multiaddr=1&s_sg=308d416baffe0edf44b13b96fc73ee4d&s_sc=100&s_st=1489647616"

// 图片服务器地址
#define IMAGE_HOST @"http://img.meelive.cn/"


// 热门直播
#define API_HotLive @"api/live/gettop"

// 附近的人
#define API_NearLive @"api/live/near_recommend" //?uid=85149891&latitude=40.090562&longitude=116.413353

// 广告地址
#define API_Advertise @"advertise/get"




@end
