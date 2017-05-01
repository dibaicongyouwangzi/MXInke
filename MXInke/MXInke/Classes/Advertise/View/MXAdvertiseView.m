//
//  MXAdvertiseView.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXAdvertiseView.h"
#import "MXAdvertiseHandler.h"
#import "MXAdvertise.h"
#import <SDWebImageDownloader.h>
#import "MXCacheHelper.h"
#import <SDWebImageManager.h>

// 全局变量
static NSInteger showTime = 3;

@interface MXAdvertiseView()
@property (weak, nonatomic) IBOutlet UIImageView *backView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation MXAdvertiseView

+ (instancetype)loadAdvertiseView {
    return [[[NSBundle mainBundle] loadNibNamed:@"MXAdvertiseView" owner:nil options:nil] firstObject];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.frame = [UIScreen mainScreen].bounds;
    
    // 展示广告
    [self showAd];
    
    // 下载广告
    [self downloadAd];
    
    // 倒计时
    [self startTimer];
}


- (void)startTimer {
    // 超时事件
    __block NSUInteger timeout = showTime + 1;
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        // 处理倒计时事件
        if (timeout <= 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.timeLabel.text = [NSString stringWithFormat:@"%zd",timeout];
            });
            timeout--;
        }
    });
    dispatch_resume(timer);
}

- (void)dismiss {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)showAd {
    
    NSString *filename = [MXCacheHelper getAdvertise];
    NSString *filePath = [NSString stringWithFormat:@"%@%@",IMAGE_HOST,filename];
    
    // 上一次存储的image
    UIImage *lastCachedImage = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:filePath];
    if (lastCachedImage) {
        self.backView.image = lastCachedImage;
    } else {
        self.hidden = YES;
    }
}



- (void)downloadAd {
    [MXAdvertiseHandler executeGetAdvertiseTaskWithSuccess:^(id obj) {
       
        MXAdvertise *ad = obj;
        NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,ad.image]];
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:imageUrl options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
            MXLog(@"图片下载成功");
            [MXCacheHelper setAdvertise:ad.image];
        }];
        
    } failure:^(id obj) {
        MXLog(@"%@",obj);
    }];
    
}


@end
