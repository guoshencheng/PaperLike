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
    self.selectedListDatasource.selections = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor], [UIColor grayColor], [UIColor magentaColor], [UIColor purpleColor]];
    [self.selectedCollectionView registerNib:[UINib nibWithNibName:SELECTION_COLLECTION_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:SELECTION_COLLECTION_CELL_ID];
    self.selectedCollectionView.dataSource = self.selectedListDatasource;
    self.dragableFlowLayout = [[DragableFlowLayout alloc] init];
    __weak typeof(self) weakSelf = self;
    self.dragableFlowLayout.moveItemData = ^(NSIndexPath *fromIndexPath, NSIndexPath *toIndexPath) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:weakSelf.selectedListDatasource.selections];
        UIColor *color = [array objectAtIndex:fromIndexPath.item];
        [array removeObjectAtIndex:fromIndexPath.item];
        [array insertObject:color atIndex:toIndexPath.item];
        weakSelf.selectedListDatasource.selections = array;
    };
    self.selectedCollectionView.collectionViewLayout = self.dragableFlowLayout;
}

- (void)configureSelectionView {
    self.selectionListDatasource = [CustomSelectionListDatasource new];
    self.selectionListDatasource.selections = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor], [UIColor grayColor], [UIColor magentaColor], [UIColor purpleColor]];
    self.circleLayout = [CircleLayout new];
    __weak typeof(self) weakSelf = self;
    self.circleLayout.moveItemData = ^(NSIndexPath *fromIndexPath, NSIndexPath *toIndexPath) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:weakSelf.self.selectionListDatasource.selections];
        UIColor *color = [array objectAtIndex:fromIndexPath.item];
        [array removeObjectAtIndex:fromIndexPath.item];
        [array insertObject:color atIndex:toIndexPath.item];
        weakSelf.selectionListDatasource.selections = array;
    };
    self.selectionCollectionView.collectionViewLayout = self.circleLayout;
    [self.selectionCollectionView registerNib:[UINib nibWithNibName:SELECTION_COLLECTION_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:SELECTION_COLLECTION_CELL_ID];
    self.selectionCollectionView.dataSource = self.selectionListDatasource;
}

@end
