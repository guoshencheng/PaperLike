//
//  BottomCollectionViewDatasource.m
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BottomCollectionViewDatasource.h"
#import "BottomContainerCollectionViewCell.h"

@implementation BottomCollectionViewDatasource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BottomContainerCollectionViewCell *bottomContainerCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:BOTTOM_CONTAINER_COLLECTIONVIEW_CELL_ID forIndexPath:indexPath];
    bottomContainerCollectionViewCell.bottomContainerCollectionViewDatasource.name = [self.datas objectAtIndex:indexPath.item];
    [bottomContainerCollectionViewCell reloadData];
    return bottomContainerCollectionViewCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

@end
