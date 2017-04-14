//
//  MXLiveCell.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXLiveCell.h"
#import "MXLive.h"
#import <UIImageView+WebCache.h>

@interface MXLiveCell()
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;
@end

@implementation MXLiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headView.layer.cornerRadius = 25;
    self.headView.layer.masksToBounds = YES;
}

- (void)setLive:(MXLive *)live {
    _live = live;
    
    [self.headView sd_setImageWithURL:[NSURL URLWithString:live.creator.portrait] placeholderImage:[UIImage imageNamed:@"default_room"]];
    self.nameLabel.text = live.creator.nick;
    self.locationLabel.text = live.city;
    self.onlineLabel.text = [@(live.onlineUsers) stringValue];
    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:live.creator.portrait] placeholderImage:[UIImage imageNamed:@"default_room"]];
}

@end
