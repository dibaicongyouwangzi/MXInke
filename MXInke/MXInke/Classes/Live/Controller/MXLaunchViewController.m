

//
//  MXLaunchViewController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXLaunchViewController.h"
#import "LFLivePreview.h"

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


- (IBAction)startLive:(UIButton *)sender {
    // 先黑屏一下
    UIView *backView = [[UIView alloc] initWithFrame:self.view.bounds];
    backView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        LFLivePreview *preView = [[LFLivePreview alloc] initWithFrame:self.view.bounds];
        preView.vc = self;
        [self.view addSubview:preView];
        
        [preView startLive];
    });
}

@end
