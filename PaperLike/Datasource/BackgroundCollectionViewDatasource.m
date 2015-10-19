//
//  BackgroundCollectionViewDatasource.m
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BackgroundCollectionViewDatasource.h"
#import "BackgroundCollectionViewCell.h"

@implementation BackgroundCollectionViewDatasource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BackgroundCollectionViewCell *backgroundCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:BACKGROUND_COLLECTIONVIEW_CELL_ID forIndexPath:indexPath];
    return backgroundCollectionViewCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

@end
