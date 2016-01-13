//
//  WKFlowLayout.m
//  WKFlowLayout
//
//  Created by 吴珂 on 16/1/12.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "WKFlowLayout.h"
#import "WKFlowLayoutDataSource.h"

static NSUInteger CellWidth = 100;
static CGFloat ContentHeight;

@implementation WKFlowLayout
{
    NSMutableArray *_yOffsets;//存储各列的当前offest
}

- (void)prepareLayout
{
    _maxNumCols = 2;//设置为两列
    
    _yOffsets = [NSMutableArray arrayWithCapacity:_maxNumCols];
    for (int i = 0; i < _maxNumCols; i++) {
        [_yOffsets addObject:@0];
    }
    
    //初始化cell的宽度
    CellWidth = self.collectionView.bounds.size.width / _maxNumCols;
    
    //事先创建好UICollectionViewLayoutAttributes
    _layoutInformation = [NSMutableDictionary dictionary];
    
    NSIndexPath *indexPath;
    NSInteger numSections = [self.collectionView numberOfSections];
    for(NSInteger section = 0; section < numSections; section++){
        NSInteger numItems = [self.collectionView numberOfItemsInSection:section];
        for(NSInteger item = 0; item < numItems; item++){
            indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attributes =
            [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
           
            NSInteger col = indexPath.item % _maxNumCols;
            
            WKFlowLayoutDataSource *ds = self.collectionView.dataSource;
            
            NSNumber *height = ds.dataSource[indexPath.row];
            attributes.frame = CGRectMake(col * CellWidth, [_yOffsets[col] floatValue], CellWidth, [height floatValue]);
            CGFloat yOffset;
            
            yOffset = [_yOffsets[col] floatValue] + [height floatValue];
            NSLog(@"yOffset:%f col:%ld", yOffset, (long)col);
            
            _yOffsets[col] = @(yOffset);

            [_layoutInformation setObject:attributes forKey:indexPath];
            //计算滚动高度
            ContentHeight = MAX(ContentHeight, CGRectGetMaxY(attributes.frame));
        }
    }
}

- (CGSize)collectionViewContentSize
{
    CGFloat contentWidth = self.collectionView.bounds.size.width;
    
    CGSize contentSize = CGSizeMake(contentWidth, ContentHeight);
    return contentSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *myAttributes = [NSMutableArray arrayWithCapacity:self.layoutInformation.count];
    for(NSString *key in self.layoutInformation.allKeys){
        UICollectionViewLayoutAttributes *attributes = [self.layoutInformation objectForKey:key];

            if(CGRectIntersectsRect(rect, attributes.frame)){
                [myAttributes addObject:attributes];

        }
    }
    return myAttributes;

}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}

//- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//
//    NSInteger col = indexPath.item % _maxNumCols;
//    
//    WKFlowLayoutDataSource *ds = self.collectionView.dataSource;
//    
//    NSNumber *height = ds.dataSource[indexPath.row];
//    attributes.frame = CGRectMake(col * CellWidth, [_yOffsets[col] floatValue], CellWidth, [height floatValue]);
//    
//    CGFloat yOffset;
//
//    yOffset = [_yOffsets[col] floatValue] + [height floatValue];
//    NSLog(@"yOffset:%f col:%ld", yOffset, (long)col);
//   
//    _yOffsets[col] = @(yOffset);
//    ContextHeight = MAX(ContextHeight, yOffset);
//   
//    return attributes;
//}






@end
