//
//  BottomContainerCollectionViewCell.m
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BottomContainerCollectionViewCell.h"
#import "BottomCollectionViewCell.h"
#import "UIScreen+Utility.h"

@interface BottomContainerCollectionViewCell()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation BottomContainerCollectionViewCell

- (void)reloadData {
    [self.collectionView reloadData];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(self.frame.size.height * (145.0 / 255), self.frame.size.height);
    self.collectionView.collectionViewLayout = layout;
    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (void)awakeFromNib {
    [self.collectionView registerNib:[UINib nibWithNibName:BOTTOM_COLLECTIONVIEW_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:BOTTOM_COLLECTIONVIEW_CELL_ID];
    self.collectionView.delegate = self;
    self.bottomContainerCollectionViewDatasource = [BottomContainerCollectionViewDatasource new
                                                    ];
    self.collectionView.dataSource = self.bottomContainerCollectionViewDatasource;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake([UIScreen screenWidth] * (51.0 / 64) * (145.0 / 255), [UIScreen screenWidth] * (51.0 / 64));
    self.collectionView.collectionViewLayout = layout;
}

//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(self.frame.size.width * (51.0 / 64) * (145.0 / 255), self.frame.size.width * (51.0 / 64));
//}

@end
