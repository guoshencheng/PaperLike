//
//  CustomSelectViewController+PickUpMotionDelegate.m
//  PaperLike
//
//  Created by guoshencheng on 10/16/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "CustomSelectViewController+PickUpMotionDelegate.h"

@implementation CustomSelectViewController (PickUpMotionDelegate)

- (void)pickUpmotion:(PickUpMotion *)pickUpmotion willBeginMoveView:(UIView *)view {
    self.movedIndex = view.tag;
    self.movedView = view;
    self.selectionCollectionView.scrollEnabled = NO;
}

- (void)pickUpmotion:(PickUpMotion *)pickUpmotion didBeginMoveView:(UIView *)view {
    view.alpha = 0;
    [self.selectionCollectionView performBatchUpdates:^{
        NSMutableArray *array = [NSMutableArray arrayWithArray:self.selectionListDatasource.selections];
        self.movedObject = [array objectAtIndex:self.movedIndex];
        [array removeObjectAtIndex:self.movedIndex];
        self.selectionListDatasource.selections = array;
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.movedIndex inSection:0];
        [self.selectionCollectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:nil];
}

- (void)pickUpmotion:(PickUpMotion *)pickUpmotion didMoveView:(UIView *)view withMovement:(CGPoint)movement {
    
}

- (void)pickUpmotion:(PickUpMotion *)pickUpmotion willEndMoveView:(UIView *)view withMovement:(CGPoint)movement {
    [self.selectionCollectionView performBatchUpdates:^{
        NSMutableArray *array = [NSMutableArray arrayWithArray:self.selectionListDatasource.selections];
        [array insertObject:self.movedObject atIndex:self.movedIndex];
        self.selectionListDatasource.selections = array;
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.movedIndex inSection:0];
        [self.selectionCollectionView insertItemsAtIndexPaths:@[indexPath]];
    } completion:nil];
}

- (void)pickUpmotion:(PickUpMotion *)pickUpmotion didEndMoveView:(UIView *)view withMovement:(CGPoint)movement {
    self.selectionCollectionView.scrollEnabled = YES;
}

- (CGFloat)pickUpmotion:(PickUpMotion *)pickUpmotion viewAlphaForMovement:(CGPoint)movement {
    return 1.0;
}

@end
