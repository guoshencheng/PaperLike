//
//  CustomSelectViewController+Configuration.m
//  PaperLike
//
//  Created by guoshencheng on 10/16/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "CustomSelectViewController+Configuration.h"
#import "SelectionCell.h"

@implementation CustomSelectViewController (Configuration)

- (void)configureViews {
    [self configurePickUpMotion];
    [self configureSelectedView];
    [self configureSelectionView];
}

- (void)configureSelectedView {
    self.selectedListDatasource = [CustomSelectionListDatasource new];
    self.selectedListDatasource.selections = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor], [UIColor grayColor], [UIColor magentaColor], [UIColor purpleColor]];
    [self.selectedCollectionView registerNib:[UINib nibWithNibName:SELECTION_COLLECTION_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:SELECTION_COLLECTION_CELL_ID];
    self.selectedCollectionView.dataSource = self.selectedListDatasource;
}

- (void)configureSelectionView {
    self.circleLayout = [CircleLayout new];
    self.selectionListDatasource = [CustomSelectionListDatasource new];
    self.selectionListDatasource.selections = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor], [UIColor grayColor], [UIColor magentaColor], [UIColor purpleColor]];
    self.selectionCollectionView.collectionViewLayout = self.circleLayout;
    [self.selectionCollectionView registerNib:[UINib nibWithNibName:SELECTION_COLLECTION_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:SELECTION_COLLECTION_CELL_ID];
    self.selectionCollectionView.dataSource = self.selectionListDatasource;
    __weak typeof(self) weakSelf = self;
    self.selectionListDatasource.configureCellBlock = ^(UICollectionViewCell *cell, NSIndexPath *indexPath) {
        [weakSelf.pickUpMotion attachToView:cell];
        cell.tag = indexPath.item;
    };
}

- (void)configurePickUpMotion {
    self.pickUpMotion = [PickUpMotion new];
    self.pickUpMotion.style = PickUpMotionVerticalFreeStyle;
    self.pickUpMotion.animationType = PickUpMotionAnimationFlyBack;
    self.pickUpMotion.delegate = self;
    self.pickUpMotion.dataSource = self;
}

@end
