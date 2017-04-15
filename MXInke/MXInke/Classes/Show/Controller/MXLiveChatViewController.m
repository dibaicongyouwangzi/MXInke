


//
//  MXLiveChatViewController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXLiveChatViewController.h"
#import "MXLive.h"
#import <UIImageView+WebCache.h>

@interface MXLiveChatViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *peopleCount;

@end

@implementation MXLiveChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.iconView.layer.cornerRadius = 15;
    self.iconView.layer.masksToBounds = YES;

}


- (void)setLive:(MXLive *)live {
    _live = live;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:live.creator.portrait] placeholderImage:[UIImage imageNamed:@"default_room"]];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.peopleCount.text = [@(arc4random_uniform(10000)) stringValue];
    }];
}

@end
