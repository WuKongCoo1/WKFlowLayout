//
//  WKFlowLayout.h
//  WKFlowLayout
//
//  Created by 吴珂 on 16/1/12.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKFlowLayout : UICollectionViewLayout

@property (nonatomic, strong) NSMutableDictionary *layoutInformation;
@property (nonatomic) NSInteger maxNumCols;

@end
