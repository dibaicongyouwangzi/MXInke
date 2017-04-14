
//
//  MXMainViewController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXMainViewController.h"

@interface MXMainViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic, strong) NSArray *datalist;

@end

@implementation MXMainViewController

- (NSArray *)datalist {
    if(!_datalist){
        _datalist = @[@"关注", @"热门", @"附近"];
    }
    return _datalist;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MXGlobalBg;
    
    // 1.设置导航栏
    [self setupNav];
    
    // 2.添加子视图控制器
    [self addChildVcs];
}

- (void)addChildVcs {
    NSArray *vcNames = @[@"MXFocusViewController", @"MXHotViewController", @"MXNearViewController"];
    for (NSInteger i = 0; i < vcNames.count; i++) {
        NSString *vcName = vcNames[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        vc.navigationItem.title = self.datalist[i];
        [self addChildViewController:vc];
    }
    
    // 将子控制器的view加到mainVc的scrollView上
    
    // 设置scrollView的contentSize
    self.contentScrollView.contentSize = CGSizeMake(vcNames.count * SCREEN_WIDTH, 0);
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    
    // 进入主控制器加载第一个页面
    [self scrollViewDidEndDecelerating:self.contentScrollView];
}

- (void)setupNav {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}


#pragma mark - <UIScrollViewDelegate>
/**
 * 减速结束时调用加载子控制器view 的方法
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    // 获取索引值
    NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    // 根据索引值返回vc引用
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断当前vc是否执行过viewDidLoad
    if ([vc isViewLoaded]) return;

    vc.view.frame = CGRectMake(scrollView.contentOffset.x, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [scrollView addSubview:vc.view];
    
}

@end
