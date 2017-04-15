//
//  MXLocationManager.h
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationBlock)(NSString *lat, NSString *lon);

@interface MXLocationManager : NSObject

+ (instancetype)sharedManager;

- (void)getGps:(LocationBlock)block;

@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *lon;

@end
