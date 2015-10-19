//
//  CustomSelectionListDatasource.m
//  PaperLike
//
//  Created by guoshencheng on 10/16/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "CustomSelectionListDatasource.h"
#import "SelectionCell.h"

@implementation CustomSelectionListDatasource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectionCell *cell = (SelectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:SELECTION_COLLECTION_CELL_ID forIndexPath:indexPath];
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, indexPath);
    }
    [cell updateCardView:[self.selections objectAtIndex:indexPath.item]];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.selections.count;
}

@end
