//
//  MXLive.h
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MXCreator;
@interface MXLive : NSObject

@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) MXCreator *creator;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString *shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *streamAddr;
@property (nonatomic, assign) NSInteger version;

@end
