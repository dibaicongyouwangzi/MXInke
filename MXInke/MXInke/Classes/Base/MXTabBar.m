
//
//  MXTabBar.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXTabBar.h"

@interface MXTabBar()
@property (nonatomic, strong) UIImageView *tabbarBgView;
@property (nonatomic, strong) NSArray *datalist;
@property (nonatomic, weak) UIButton *lastSelectedItem;
@end

@implementation MXTabBar

- (UIImageView *)tabbarBgView {
    if(!_tabbarBgView){
        _tabbarBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbarBgView;
}

- (NSArray *)datalist {
    if(!_datalist){
        _datalist = @[@"tab_live", @"tab_me"];
    }
    return _datalist;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 1.添加背景
        [self addSubview:self.tabbarBgView];
        
        // 2.添加两个item
        for (NSInteger i = 0; i < self.datalist.count; i++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            item.tag = i;
            // 不让图片在高亮下改变
            item.adjustsImageWhenHighlighted = NO;
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:item];
            
            if (i == 0) {
                item.selected = YES;
                self.lastSelectedItem.selected = NO;
                self.lastSelectedItem = item;
            }
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 1.背景frame
    self.tabbarBgView.frame = self.bounds;
    
    // 2.itemframe
    CGFloat btnW = self.bounds.size.width / self.datalist.count;
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        UIView *btn = self.subviews[i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake(btn.tag * btnW, 0, btnW, self.bounds.size.height);
        }
    }
}


- (void)itemClick:(UIButton *)button {
    
    // 1.切换选中状态
    self.lastSelectedItem.selected = NO;
    button.selected = YES;
    self.lastSelectedItem = button;
    
    // 2.设置动画
    [UIView animateWithDuration:0.25 animations:^{
        // 将按钮扩大1.5倍
        button.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            // 恢复原始状态
            button.transform = CGAffineTransformIdentity;
        }];
    }];
    
    // 3.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:clickButton:)]) {
        [self.delegate tabBar:self clickButton:button.tag];
    }
}

@end
