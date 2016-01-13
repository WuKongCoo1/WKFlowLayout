//
//  WKFlowLayoutDataSource.m
//  WKFlowLayout
//
//  Created by 吴珂 on 16/1/12.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "WKFlowLayoutDataSource.h"

static NSString *imageCellIdentifier = @"imageCellIdentifier";

@implementation WKFlowLayoutDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray array];
        for (int i = 0; i < 100; i++) {
            [self.dataSource addObject:[NSNumber numberWithInt:(arc4random_uniform(80) + 50)]];
        }
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:imageCellIdentifier forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    
    
    return cell;
}

- (void)addRandomDataWithNum:(NSInteger)num
{
    for (int i = 0; i < num; i++) {
        [self.dataSource addObject:[NSNumber numberWithInt:(arc4random_uniform(80) + 50)]];
    }
}


@end
