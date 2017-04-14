//
//  MXTabBar.h
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MXTabBar;

typedef NS_ENUM(NSUInteger, MXItemType) {
    MXItemTypeLive = 0, //展示直播
    MXItemTypeMe, //我的
    MXItemTypeLaunch //启动直播
};

@protocol MXTabBarDelegate <NSObject>
- (void)tabBar:(MXTabBar *)tabBar clickButton:(MXItemType)index;
@end

@interface MXTabBar : UIView

/** 代理 */
@property (nonatomic, weak) id<MXTabBarDelegate> delegate;

@end
