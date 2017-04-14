
 //
//  MXBaseNavigationController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXBaseNavigationController.h"

@interface MXBaseNavigationController ()

@end

@implementation MXBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏的背景色
    self.navigationBar.barTintColor = MXColor(0, 216, 201);
    
    // 设置导航栏上子控件的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
}

@end
