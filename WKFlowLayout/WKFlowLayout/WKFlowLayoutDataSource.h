//
//  WKFlowLayoutDataSource.h
//  WKFlowLayout
//
//  Created by 吴珂 on 16/1/12.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WKFlowLayoutDataSource : NSObject<UICollectionViewDataSource>

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) NSMutableArray *dataSource;

- (void)addRandomDataWithNum:(NSInteger)num;

@end
