//
//  MXMainViewController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXMainViewController.h"
#import "MXMainTopView.h"
#import <YYKit/YYKit.h>

@interface MXMainViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic, strong) NSArray *datalist;
@property (nonatomic, strong) MXMainTopView *topView;

@end

@implementation MXMainViewController


- (NSArray *)datalist {
    if(!_datalist){
        _datalist = @[@"关注", @"热门", @"附近"];
    }
    return _datalist;
}

- (MXMainTopView *)topView {
    if(!_topView){
        _topView = [[MXMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.datalist];
        
        @weakify(self);
        _topView.block = ^(NSInteger tag){
            @strongify(self);
            [self.contentScrollView setContentOffset:CGPointMake(tag * SCREEN_WIDTH, self.contentScrollView.contentOffset.y) animated:YES];
        };
    }
    return _topView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
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
    
    // 默认先展示第二个页面
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    // 进入主控制器加载第一个页面
    [self scrollViewDidEndDecelerating:self.contentScrollView];
}

- (void)setupNav {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];

    self.navigationItem.titleView = self.topView;
}



#pragma mark - <UIScrollViewDelegate>
/**
 * 减速结束时调用加载子控制器view的方法
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    [self scrollViewDidEndScrollingAnimation:scrollView];
}


/**
 * 动画结束调用代理
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    // 获取索引值
    NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    // 索引值联动topView
    [self.topView scrolling:index];
    
    // 根据索引值返回vc引用
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断当前vc是否执行过viewDidLoad
    if ([vc isViewLoaded]) return;
    
    vc.view.frame = CGRectMake(scrollView.contentOffset.x, 0, scrollView.frame.size.width, SCREEN_HEIGHT);
    [scrollView addSubview:vc.view];
    
}

@end
