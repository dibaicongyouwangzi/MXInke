
//
//  MXFocusViewController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXFocusViewController.h"
#import "MXLiveCell.h"
#import "MXPlayerViewController.h"

static NSString *identifier = @"focus";

@interface MXFocusViewController ()
@property (nonatomic, strong) NSArray *datalist;

@end

@implementation MXFocusViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadData];
    
    [self initUI];
}

- (void)initUI {
    self.view.backgroundColor = MXGlobalBg;
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    [self.tableView registerNib:[UINib nibWithNibName:@"MXLiveCell" bundle:nil] forCellReuseIdentifier:identifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (void)loadData {
    MXLive *live = [[MXLive alloc] init];
    live.city = @"南京市";
    live.onlineUsers = 81;
    live.streamAddr = Live_Me;
    
    MXCreator *creator = [[MXCreator alloc] init];
    live.creator = creator;
    creator.nick = @"大铲子";
    creator.portrait = @"dachanzi";
    
    self.datalist = @[live];
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MXLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.live = self.datalist[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70 + SCREEN_WIDTH;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MXLive *live = self.datalist[indexPath.row];
    MXPlayerViewController *playerVc = [[MXPlayerViewController alloc] init];
    playerVc.live = live;
    [self.navigationController pushViewController:playerVc animated:YES];
}




@end
