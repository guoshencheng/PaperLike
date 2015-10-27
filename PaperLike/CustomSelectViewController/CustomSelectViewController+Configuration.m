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
    self.dragableFlowLayout.sendGestureBeganOut = ^(UILongPressGestureRecognizer *gesutre) {
        [weakSelf.circleLayout publicHandleGestureBegan:gesutre];
    };
    self.dragableFlowLayout.sendGestureChangedOut = ^(UILongPressGestureRecognizer *gesture, CGPoint dragPointOnCanvas) {
        [weakSelf.circleLayout publicHandleGestureChanged:gesture dragPointOnCanvas:dragPointOnCanvas];
    };
    self.dragableFlowLayout.sendGestureEndedOut = ^(UILongPressGestureRecognizer *gesture, CGPoint dragPointOnCanvas) {
        [weakSelf.circleLayout publicHandleGestureEnded:gesture dragPointOnCanvas:dragPointOnCanvas];
    };
    self.dragableFlowLayout.sendIfShouldBeganGesture = ^(Bundle *bundle) {
        weakSelf.circleLayout.bundle = bundle;
    };
    self.dragableFlowLayout.addItemData = ^(NSIndexPath *indexPath) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:weakSelf.selectedListDatasource.selections];
        UIColor *color = [UIColor blackColor];
        [array insertObject:color atIndex:indexPath.item];
        weakSelf.selectedListDatasource.selections = array;
    };
    
    self.dragableFlowLayout.checkIfBack = ^(CGPoint drag) {
        if (drag.y < weakSelf.view.frame.size.height / 2) {
            return YES;
        } else {
            return NO;
        }
    };
    self.dragableFlowLayout.sendIfShouldFlyToOthers = ^() {
        [weakSelf.circleLayout publicAnimationAddCell];
    };
    self.dragableFlowLayout.deleteItemData = ^(NSIndexPath *indexPath) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:weakSelf.selectedListDatasource.selections];
        [array removeObjectAtIndex:indexPath.row];
        weakSelf.selectedListDatasource.selections = array;
    };
    self.dragableFlowLayout.finishAnimationForCellMove = ^() {
        [weakSelf moveDataFromSelectionCollecionView];
        [weakSelf.circleLayout.bundle.representationImageView removeFromSuperview];
        weakSelf.circleLayout.bundle.sourceCell.hidden = NO;
        weakSelf.circleLayout.bundle = nil;
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
    self.circleLayout.sendGestureBeganOut = ^(UILongPressGestureRecognizer *gesutre) {
        [weakSelf.dragableFlowLayout publicHandleGestureBegan:gesutre];
    };
    self.circleLayout.sendGestureChangedOut = ^(UILongPressGestureRecognizer *gesture, CGPoint dragPointOnCanvas) {
        [weakSelf.dragableFlowLayout publicHandleGestureChanged:gesture dragPointOnCanvas:dragPointOnCanvas];
    };
    self.circleLayout.sendGestureEndedOut = ^(UILongPressGestureRecognizer *gesture, CGPoint dragPointOnCanvas) {
        [weakSelf.dragableFlowLayout publicHandleGestureEnded:gesture dragPointOnCanvas:dragPointOnCanvas];
    };
    self.circleLayout.sendIfShouldBeganGesture = ^(Bundle *bundle) {
        weakSelf.dragableFlowLayout.bundle = bundle;
    };
    self.circleLayout.addItemData = ^(NSIndexPath *indexPath) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:weakSelf.selectionListDatasource.selections];
        UIColor *color = [UIColor blackColor];
        [array insertObject:color atIndex:indexPath.item];
        weakSelf.selectionListDatasource.selections = array;
    };
    self.circleLayout.sendIfShouldFlyToOthers = ^() {
        [weakSelf.dragableFlowLayout publicAnimationAddCell];
    };
    self.circleLayout.deleteItemData = ^(NSIndexPath *indexPath) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:weakSelf.selectionListDatasource.selections];
        [array removeObjectAtIndex:indexPath.row];
        weakSelf.selectionListDatasource.selections = array;
    };
    self.circleLayout.finishAnimationForCellMove = ^() {
        [weakSelf moveDataToSelectionCollecionView];
        [weakSelf.dragableFlowLayout.bundle.representationImageView removeFromSuperview];
        weakSelf.dragableFlowLayout.bundle.sourceCell.hidden = NO;
        weakSelf.dragableFlowLayout.bundle = nil;
    };
    self.circleLayout.checkIfBack = ^(CGPoint drag) {
        if (drag.y < weakSelf.view.frame.size.height / 2) {
            return NO;
        } else {
            return YES;
        }
    };
    self.selectionCollectionView.collectionViewLayout = self.circleLayout;
    [self.selectionCollectionView registerNib:[UINib nibWithNibName:SELECTION_COLLECTION_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:SELECTION_COLLECTION_CELL_ID];
    self.selectionCollectionView.dataSource = self.selectionListDatasource;
}

- (void)moveDataFromSelectionCollecionView {
    NSIndexPath *indexPath = [self.selectionCollectionView indexPathForCell:self.circleLayout.bundle.sourceCell];
    UIColor *color = [self.selectionListDatasource.selections objectAtIndex:indexPath.item];
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.selectionListDatasource.selections];
    [array removeObjectAtIndex:indexPath.item];
    self.selectionListDatasource.selections = array;
    [self.selectionCollectionView deleteItemsAtIndexPaths:@[indexPath]];
    
    indexPath = [self.selectedCollectionView indexPathForCell:self.dragableFlowLayout.publicSourceCell];
    array = [[NSMutableArray alloc] initWithArray:self.selectedListDatasource.selections];
    [array replaceObjectAtIndex:indexPath.item withObject:color];
    self.selectedListDatasource.selections = array;
}

- (void)moveDataToSelectionCollecionView {
    NSIndexPath *indexPath = [self.selectedCollectionView indexPathForCell:self.dragableFlowLayout.bundle.sourceCell];
    UIColor *color = [self.selectedListDatasource.selections objectAtIndex:indexPath.item];
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.selectedListDatasource.selections];
    [array removeObjectAtIndex:indexPath.item];
    self.selectedListDatasource.selections = array;
    [self.selectedCollectionView deleteItemsAtIndexPaths:@[indexPath]];
    
    indexPath = [self.selectionCollectionView indexPathForCell:self.circleLayout.publicSourceCell];
    array = [[NSMutableArray alloc] initWithArray:self.selectionListDatasource.selections];
    [array replaceObjectAtIndex:indexPath.item withObject:color];
    self.selectionListDatasource.selections = array;
}

@end
