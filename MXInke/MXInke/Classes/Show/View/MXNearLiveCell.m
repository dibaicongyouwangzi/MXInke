
//
//  MXNearLiveCell.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/15.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXNearLiveCell.h"
#import <UIImageView+WebCache.h>
#import "MXLive.h"

@interface MXNearLiveCell()
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *diatanceLabel;

@end

@implementation MXNearLiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setLive:(MXLive *)live {
    _live = live;
    [self.headView sd_setImageWithURL:[NSURL URLWithString:live.creator.portrait] placeholderImage:[UIImage imageNamed:@"default_room"]];
    self.diatanceLabel.text = live.distance;
}

- (void)showAnimation {
    
    if (self.live.isShow) {
        return;
    }
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:0.25 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        self.live.show = YES;
    }];
}
@end
