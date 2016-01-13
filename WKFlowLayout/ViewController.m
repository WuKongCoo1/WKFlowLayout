//
//  ViewController.m
//  WKFlowLayout
//
//  Created by 吴珂 on 16/1/12.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController.h"
#import <MJRefresh.h>
#import "WKFlowLayoutDataSource.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.scrollEnabled = YES;
    __weak typeof(self)weakSelf = self;
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        WKFlowLayoutDataSource *dataSource = weakSelf.collectionView.dataSource;
        [dataSource addRandomDataWithNum:10];
        [weakSelf.collectionView.mj_footer endRefreshing];
        
        [weakSelf.collectionView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
