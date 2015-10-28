//
//  BottomContainerCollectionViewDatasource.m
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BottomContainerCollectionViewDatasource.h"
#import "BottomCollectionViewCell.h"

@implementation BottomContainerCollectionViewDatasource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BottomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BOTTOM_COLLECTIONVIEW_CELL_ID forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"%@%@%@", self.name, @(indexPath.item + 1), @".jpg"];
    UIImage *image = [UIImage imageNamed:imageName];
    [cell updateWithImage:image];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (!self.name) {
        return 0;
    }
    return 6;
}

@end
