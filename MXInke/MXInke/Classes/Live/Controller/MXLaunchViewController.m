

//
//  MXLaunchViewController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXLaunchViewController.h"

@interface MXLaunchViewController ()

@end

@implementation MXLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = MXGlobalBg;
}

- (IBAction)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
