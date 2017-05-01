//
//  MXLoginViewController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/5/1.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXLoginViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MXTabBarController.h"

static BOOL hasBeenUsed = false;

@interface MXLoginViewController ()
/** 视频播放器 */
@property (nonatomic, strong) AVPlayer *videoPlayer;

@end

@implementation MXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAVPlayer];
    
    [self setupLoginButton];
}

- (void)setupAVPlayer {
    // 1.获取视频路径
    NSURL *videoUrl = [[NSBundle mainBundle] URLForResource:@"videoAd" withExtension:@"mp4"];
    
    // 2.创建AVPlayer
    self.videoPlayer = [AVPlayer playerWithURL:videoUrl];
    self.videoPlayer.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    self.videoPlayer.muted = false;// fasle:打开声音(默认) true：关掉声音
    
    // 3.创建AVPlayerLayer
    AVPlayerLayer *videoLayer = [AVPlayerLayer playerLayerWithPlayer:self.videoPlayer];
    videoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    videoLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:videoLayer];
    
    self.view.alpha = 0;
    [UIView animateWithDuration:3.0 animations:^{
        self.view.alpha = 1.0;
    }];
    
    // 4.播放
    [self.videoPlayer play];
    
    // 5.通知
    // 当视频播放结束时添加一个循环播放的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loopVideo)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:nil];
    // app从后台进入前台时从头开始播放
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loopVideo)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    hasBeenUsed = true;
}


- (void)dealloc {
    if (hasBeenUsed) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
    }
}


- (void)loopVideo {
    [self.videoPlayer seekToTime:kCMTimeZero];
    [self.videoPlayer play];
}

- (void)setupLoginButton {
    UIButton * button = [[UIButton alloc] init];
    [button addTarget:self action:@selector(gototabBarVc) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(24, [UIScreen mainScreen].bounds.size.height - 32 - 48, [UIScreen mainScreen].bounds.size.width - 48, 48);
    [button setTitle:@"进入应用" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.cornerRadius = 24;
    button.layer.borderWidth = 1;
    
    [self.view addSubview:button];
    
    button.alpha = 0;
    [UIView animateWithDuration:3.0 animations:^{
        button.alpha = 1.0;
    }];
}

- (void)gototabBarVc {
    MXTabBarController *tabBarVc = [[MXTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVc;
}


@end
