//
//  MXMeViewController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/5/1.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXMeViewController.h"
#import "MXMeInfoView.h"
#import "MXSetting.h"

@interface MXMeViewController ()

@property (nonatomic, strong) NSArray *datalist;
/** 头部 */
@property (nonatomic, strong) MXMeInfoView *infoView;

@end

@implementation MXMeViewController

- (instancetype)init {
    return [[MXMeViewController alloc] initWithStyle:UITableViewStyleGrouped];
}

- (NSArray *)datalist {
    
    if (!_datalist) {
        _datalist = [NSArray array];
    }
    return _datalist;
}

- (MXMeInfoView *)infoView {
    if(!_infoView){
        _infoView = [MXMeInfoView loadInfoView];
//        _infoView.frame = CGRectMake(0, 0, 0, SCREEN_HEIGHT * 0.3);
    }
    return _infoView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.rowHeight = 60;
    self.tableView.sectionFooterHeight = 0;
    
    [self loadData];
}

- (void)loadData {
    // 装载数据
    MXSetting *setting1 = [[MXSetting alloc] init];
    setting1.title = @"映客贡献榜";
    setting1.subTitle = @"";
    setting1.vcName = @"MXGongxianViewController";
    
    MXSetting *setting2 = [[MXSetting alloc] init];
    setting2.title = @"收益";
    setting2.subTitle = @"0 映票";
    setting2.vcName = @"MXShouyiViewController";
    
    MXSetting *setting3 = [[MXSetting alloc] init];
    setting3.title = @"账户";
    setting3.subTitle = @"0 钻石";
    setting3.vcName = @"MXZuanshiViewController";
    
    MXSetting *setting4 = [[MXSetting alloc] init];
    setting4.title = @"等级";
    setting4.subTitle = @"3 级";
    setting4.vcName = @"MXDengjiViewController";

    MXSetting *setting5 = [[MXSetting alloc] init];
    setting5.title = @"设置";
    setting5.subTitle = @"";
    setting5.vcName = @"MXSettingViewController";
    
    // 分组
    NSArray *arr1 = @[setting1, setting2, setting3];
    NSArray *arr2 = @[setting4];
    NSArray *arr3 = @[setting5];
    
    self.datalist = @[arr1, arr2, arr3];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datalist.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.datalist[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    MXSetting *setting = self.datalist[indexPath.section][indexPath.row];
    cell.textLabel.text = setting.title;
    cell.detailTextLabel.text = setting.subTitle;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return self.infoView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return SCREEN_HEIGHT * 0.4;
    }
    return 10;
}


@end
