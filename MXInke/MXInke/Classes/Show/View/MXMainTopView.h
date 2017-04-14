//
//  MXMainTopView.h
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface MXMainTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

/** block */
@property (nonatomic, copy) MainTopBlock block;

- (void)scrolling:(NSInteger)tag;

@end
