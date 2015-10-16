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
    [self configureSelectedView];
    [self configureSelectionView];
}

- (void)configureSelectedView {
    self.selectedListDatasource = [CustomSelectionListDatasource new];
    self.selectedListDatasource.selections = @[@"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1"];
    [self.selectedCollectionView registerNib:[UINib nibWithNibName:SELECTION_COLLECTION_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:SELECTION_COLLECTION_CELL_ID];
    self.selectedCollectionView.dataSource = self.selectedListDatasource;
}

- (void)configureSelectionView {
    self.circleLayout = [CircleLayout new];
    self.selectionListDatasource = [CustomSelectionListDatasource new];
    self.selectionListDatasource.selections = @[@"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1"];
    self.selectionCollectionView.collectionViewLayout = self.circleLayout;
    [self.selectionCollectionView registerNib:[UINib nibWithNibName:SELECTION_COLLECTION_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:SELECTION_COLLECTION_CELL_ID];
    self.selectionCollectionView.dataSource = self.selectionListDatasource;
}

@end
