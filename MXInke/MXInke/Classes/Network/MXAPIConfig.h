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
#define SERVER_HOST @"http://service.ingkee.com"

// 图片服务器地址
#define IMAGE_HOST @"http://img.meelive.cn/"


// 热门直播
#define API_HotLive @"api/live/gettop"

// 附近的人
#define API_NearLive @"api/live/near_recommend" //?uid=85149891&latitude=40.090562&longitude=116.413353

// 广告地址
#define API_Advertise @"advertise/get"


#define Live_Me @"rtmp://live.hkstv.hk.lxdns.com:1935/live/dachanzi"

@end
