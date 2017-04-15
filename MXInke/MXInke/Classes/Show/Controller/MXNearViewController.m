
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

@interface MXNearViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
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
    self.view.backgroundColor = MXRandomColor;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MXNearLiveCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
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


@end

