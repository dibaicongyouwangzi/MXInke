//
//  MXTabBarController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXTabBarController.h"
#import "MXTabBar.h"
#import "MXBaseNavigationController.h"

@interface MXTabBarController ()<MXTabBarDelegate>
@property (nonatomic, strong) MXTabBar *tabB;
@end

@implementation MXTabBarController

- (MXTabBar *)tabB {
    if(!_tabB){
        _tabB = [[MXTabBar alloc] init];
        _tabB.frame = CGRectMake(0, 0, SCREEN_WIDTH, 49);
        _tabB.delegate = self;
    }
    return _tabB;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.添加控制器
    [self addVcs];
    
    // 2.添加tabBar
    [self.tabBar addSubview:self.tabB];
}

- (void)addVcs {
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"MXMainViewController", @"MXProfileViewController"]];
    for (NSInteger i = 0; i < array.count; i++) {
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        MXBaseNavigationController *nav = [[MXBaseNavigationController alloc] initWithRootViewController:vc];
        [array replaceObjectAtIndex:i withObject:nav];
    }
    
    self.viewControllers = array;
}


#pragma mark - <MXTabBarDelegate>
- (void)tabBar:(MXTabBar *)tabBar clickButton:(MXItemType)index {
    
}


@end
