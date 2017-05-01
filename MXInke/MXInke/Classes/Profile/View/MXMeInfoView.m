//
//  MXMeInfoView.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/5/1.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXMeInfoView.h"
@interface MXMeInfoView()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation MXMeInfoView

+ (instancetype)loadInfoView {
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView.layer.cornerRadius = 35 / 2;
    self.imageView.layer.masksToBounds = YES;
}
@end
