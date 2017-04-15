
//
//  MXNearViewController.m
//  MXInke
//
//  Created by 迪拜葱油王子 on 2017/4/14.
//  Copyright © 2017年 迪拜葱油王子. All rights reserved.
//

#import "MXNearViewController.h"
#import "MXLiveHandler.h"
#import "MXNearLiveCell.h"
#import <YYKit.h>
#import "MXPlayerViewController.h"

#define kMargin 5
#define kItemWidth 100

@interface MXNearViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *datalist;

@end

@implementation MXNearViewController

static NSString *identifier = @"near";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self loadData];
   
}


- (void)initUI {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MXNearLiveCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    self.collectionView.scrollIndicatorInsets = self.collectionView.contentInset;
}


- (void)loadData {
    
    [MXLiveHandler executeGetNearLiveTaskWithSuccess:^(id obj) {
    
        self.datalist = obj;
        [self.collectionView reloadData];
    
    } failure:^(id obj) {
        NSLog(@"%@",obj);
    }];
}



#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datalist.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MXNearLiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.live = self.datalist[indexPath.row];
    return cell;
}


/**
 * cell将要显示时调用
 */
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    MXNearLiveCell *c = (MXNearLiveCell *)cell;
    [c showAnimation];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    MXLive *live = self.datalist[indexPath.row];
    MXPlayerViewController *playerVc = [[MXPlayerViewController alloc] init];
    playerVc.live = live;
    [self.navigationController pushViewController:playerVc animated:YES];
}


#pragma mark - <UICollectionViewDelegateFlowLayout>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger count = self.collectionView.width / kItemWidth;
    CGFloat extraWidth = (self.collectionView.width - kMargin * (count + 1)) / count;
    return CGSizeMake(extraWidth, extraWidth+20);
}

@end

