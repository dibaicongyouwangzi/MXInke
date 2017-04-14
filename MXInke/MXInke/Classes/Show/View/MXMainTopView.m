//
//  MXMainTopView.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXMainTopView.h"
#import <YYKit/YYKit.h>

@interface MXMainTopView()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation MXMainTopView

- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles {

    if (self = [super initWithFrame:frame]) {
        
        CGFloat buttonW = self.bounds.size.width / titles.count;
        CGFloat buttonH = self.bounds.size.height;
        CGFloat buttonY = 0;
        for(NSInteger i = 0; i < titles.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.buttons addObject:button];
            button.tag = i;
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:titles[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:18];
            CGFloat buttonX = i * buttonW;
            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            [self addSubview:button];
            
            
            if (i == 1) {
                
                [button.titleLabel sizeToFit];

                CGFloat h = 2;
                CGFloat y = 40;
                self.lineView = [[UIView alloc] init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                self.lineView.height = h;
                self.lineView.width = button.titleLabel.width;
                self.lineView.top = y;
                self.lineView.centerX = button.centerX;
                [self addSubview:self.lineView];
            }
        }
    }
    return self;
}

- (void)btnClick:(UIButton *)button {
    
    [UIView animateWithDuration:0.4 animations:^{
        self.lineView.centerX = button.centerX;
    }];
    
    !self.block ? : self.block(button.tag);
}


/**
 * mainVc滚动时调用
 */
- (void)scrolling:(NSInteger)tag {

    UIButton *button = self.buttons[tag];
    [UIView animateWithDuration:0.4 animations:^{
        self.lineView.centerX = button.centerX;
    }];
}

@end
