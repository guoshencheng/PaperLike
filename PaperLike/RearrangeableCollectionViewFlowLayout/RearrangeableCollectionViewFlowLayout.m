//
//  RearrangeableCollectionViewFlowLayout.m
//  PaperLike
//
//  Created by guoshencheng on 10/22/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "RearrangeableCollectionViewFlowLayout.h"

@implementation Bundle

+ (instancetype)bundleWithOffset:(CGPoint)offset sourceCell:(UICollectionViewCell *)sourceCell representationView:(UIView *)representationView currentIndex:(NSIndexPath *)currentIndexPath {
    Bundle *bundle = [[Bundle alloc] init];
    bundle.offset = offset;
    bundle.sourceCell = sourceCell;
    bundle.representationImageView = representationView;
    bundle.currentIndexPath = currentIndexPath;
    return bundle;
}

@end

@implementation RearrangeableCollectionViewFlowLayout {
    BOOL hasAddLongPressGesture;
}

- (instancetype)init {
    if (self = [super init]) {
        hasAddLongPressGesture = NO;
        self.animating = NO;
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    hasAddLongPressGesture = NO;
    self.animating = NO;
    [self setup];
}

- (void)setup {
    if (self.collectionView && !hasAddLongPressGesture) {
        UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        longPressGestureRecognizer.minimumPressDuration = 0.2;
        longPressGestureRecognizer.delegate = self;
        [self.collectionView addGestureRecognizer:longPressGestureRecognizer];
        hasAddLongPressGesture = YES;
        if (!self.canvas) {
            self.canvas = self.collectionView.superview;
        }
    }
}

- (void)prepareLayout {
    [super prepareLayout];
    [self caculateBorders];
    [self setup];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.canvas && self.collectionView) {
        CGPoint pointPressedInCanvans = [gestureRecognizer locationInView:self.canvas];
        for (UICollectionViewCell *cell in self.collectionView.visibleCells) {
            CGRect cellInCanvasFrame = [self.canvas convertRect:cell.frame fromView:self.collectionView];
            cellInCanvasFrame.size = self.itemSize;
            if (CGRectContainsPoint(cellInCanvasFrame, pointPressedInCanvans)) {
                UIView *representationView = [cell snapshotViewAfterScreenUpdates:YES];
                representationView.frame = cellInCanvasFrame;
                representationView.transform = cell.transform;
                CGPoint offset = CGPointMake(pointPressedInCanvans.x - cellInCanvasFrame.origin.x, pointPressedInCanvans.y - cellInCanvasFrame.origin.y);
                NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
                self.bundle = [Bundle bundleWithOffset:offset sourceCell:cell representationView:representationView currentIndex:indexPath];
                if (self.sendIfShouldBeganGesture) {
                    self.sendIfShouldBeganGesture(self.bundle);
                }
                break;
            }
        }
    }
    return self.bundle ? YES : NO;
}

- (void)handleGesture:(UILongPressGestureRecognizer *)gesture {
    CGPoint dragPointOnCanvas = [gesture locationInView:self.canvas];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            [self handleGestureBegan:gesture];
            break;
        case UIGestureRecognizerStateChanged:
            [self handleGestureChanged:gesture dragPointOnCanvas:dragPointOnCanvas];
            break;
        case UIGestureRecognizerStateEnded:
            [self handleGestureEnded:gesture dragPointOnCanvas:dragPointOnCanvas];
            break;
        default:
            break;
    }
}

//- (void)checkForDraggingAtTheEdgeAndAnimatePaging:(UILongPressGestureRecognizer *)gestureRecognizer {
//    if (self.animating) {
//        return;
//    }
//    if (self.bundle) {
//        CGRect nextPageRect = self.collectionView.bounds;
//        if (CGRectIntersectsRect(self.bundle.representationImageView.frame, [[self.hitTestRectagles objectForKey:@"left"] CGRectValue])) {
//            nextPageRect.origin.x -= nextPageRect.size.width / 2;
//            if (nextPageRect.origin.x < 0.0) {
//                nextPageRect.origin.x = 0.0;
//            }
//            
//        } else if (CGRectIntersectsRect(self.bundle.representationImageView.frame, [[self.hitTestRectagles objectForKey:@"right"] CGRectValue])) {
//            nextPageRect.origin.x += nextPageRect.size.width / 2;
//            if (nextPageRect.origin.x >= self.collectionView.contentSize.width - nextPageRect.size.width) {
//                nextPageRect.origin.x = self.collectionView.contentSize.width - nextPageRect.size.width;
//            }
//        }
//        if (!CGRectEqualToRect(nextPageRect, self.collectionView.bounds)) {
//            CGFloat delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
//            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
//                self.animating = NO;
//                [self handleGesture:gestureRecognizer];
//            });
//            self.animating = YES;
//            [self.collectionView scrollRectToVisible:nextPageRect animated:YES];
//        }
//    }
//}

- (void)handleGestureBegan:(UILongPressGestureRecognizer *)gesture {
    self.bundle.sourceCell.hidden = YES;
    [self.canvas addSubview:self.bundle.representationImageView];
    [UIView animateWithDuration:0.2 animations:^{
        self.bundle.representationImageView.transform = CGAffineTransformIdentity;
    }];
    if (self.sendGestureBeganOut) {
        self.sendGestureBeganOut(gesture);
    }
}

- (void)publicHandleGestureBegan:(UILongPressGestureRecognizer *)gesture {
    CGPoint gesturePoint = [gesture locationInView:self.collectionView];
    gesturePoint.y = self.collectionView.frame.size.height / 2;
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:gesturePoint];
    if (self.addItemData) {
        self.addItemData(indexPath);
    }
    //self.currentIndexPath = [NSIndexPath indexPathForItem:self.bundle.currentIndexPath.item inSection:self.bundle.currentIndexPath.section];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
    self.publicSourceCell = [self.collectionView cellForItemAtIndexPath:indexPath];
}

- (void)handleGestureChanged:(UILongPressGestureRecognizer *)gesture dragPointOnCanvas:(CGPoint)dragPointOnCanvas {
    CGRect imageViewFrame = self.bundle.representationImageView.frame;
    CGPoint point = CGPointMake(dragPointOnCanvas.x - self.bundle.offset.x, dragPointOnCanvas.y - self.bundle.offset.y);
    imageViewFrame.origin = point;
    self.bundle.representationImageView.frame = imageViewFrame;
    CGPoint gesturePoint = [gesture locationInView:self.collectionView];
    gesturePoint.y = self.collectionView.frame.size.height / 2;
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:gesturePoint];
    if (indexPath) {
        //[self checkForDraggingAtTheEdgeAndAnimatePaging:gesture];
        if (![indexPath isEqual:self.bundle.currentIndexPath]) {
            if (self.moveItemData) {
                self.moveItemData(self.bundle.currentIndexPath, indexPath);
            }
            [self.collectionView moveItemAtIndexPath:self.bundle.currentIndexPath toIndexPath:indexPath];
            self.bundle.currentIndexPath = indexPath;
        }
        
    }
    if (self.sendGestureChangedOut) {
        self.sendGestureChangedOut(gesture, dragPointOnCanvas);
    }
}

- (void)publicHandleGestureChanged:(UILongPressGestureRecognizer *)gesture dragPointOnCanvas:(CGPoint)dragPointOnCanvas {
    CGPoint gesturePoint = [gesture locationInView:self.collectionView];
    gesturePoint.y = self.collectionView.frame.size.height / 2;
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:gesturePoint];
    if (indexPath) {
        NSIndexPath *curentIndexPath = [self.collectionView indexPathForCell:self.publicSourceCell];
        if (![indexPath isEqual:curentIndexPath]) {
            if (self.moveItemData) {
                self.moveItemData(curentIndexPath, indexPath);
            }
            [self.collectionView moveItemAtIndexPath:curentIndexPath toIndexPath:indexPath];
            //self.currentIndexPath = indexPath;
        }
        
    }
}

- (void)handleGestureEnded:(UILongPressGestureRecognizer *)gesture dragPointOnCanvas:(CGPoint)dragPointOnCanvas {
    if (self.checkIfBack(dragPointOnCanvas)) {
        CGRect sourceCellInCanvas = [self.canvas convertRect:self.bundle.sourceCell.frame fromView:self.collectionView];
        sourceCellInCanvas.size = self.itemSize;
        [UIView animateWithDuration:0.2 animations:^{
            self.bundle.representationImageView.frame = sourceCellInCanvas;
            self.bundle.representationImageView.transform = self.bundle.sourceCell.transform;
        } completion:^(BOOL finished) {
            self.bundle.sourceCell.hidden = NO;
            [self.bundle.representationImageView removeFromSuperview];
            [self.collectionView reloadData];
            self.bundle = nil;
        }];
        if (self.sendGestureEndedOut) {
            self.sendGestureEndedOut(gesture, dragPointOnCanvas);
        }
    } else {
        if (self.sendIfShouldFlyToOthers) {
            self.sendIfShouldFlyToOthers();
        }
    }
}

- (void)publicHandleGestureEnded:(UILongPressGestureRecognizer *)gesture dragPointOnCanvas:(CGPoint)dragPointOnCanvas {
    if (self.deleteItemData) {
        self.deleteItemData([self.collectionView indexPathForCell:self.publicSourceCell]);
    }
    [self.collectionView deleteItemsAtIndexPaths:@[[self.collectionView indexPathForCell:self.publicSourceCell]]];
}

- (void)publicAnimationAddCell {
    CGRect sourceCellInCanvas = [self.canvas convertRect:self.publicSourceCell.frame fromView:self.collectionView];
    sourceCellInCanvas.size = self.itemSize;
    [UIView animateWithDuration:0.2 animations:^{
        self.bundle.representationImageView.frame = sourceCellInCanvas;
        self.bundle.representationImageView.transform = self.bundle.sourceCell.transform;
    } completion:^(BOOL finished) {
        if (self.finishAnimationForCellMove) {
            self.finishAnimationForCellMove();
        }
        self.bundle.sourceCell.hidden = NO;
        [self.collectionView reloadData];
        self.bundle = nil;
    }];
}

- (void)caculateBorders {
    if (self.collectionView) {
        self.hitTestRectagles = [[NSMutableDictionary alloc] init];
        self.collectionViewFrameInCanvas = self.collectionView.frame;
        if (self.canvas != self.collectionView.superview) {
            self.collectionViewFrameInCanvas = [self.canvas convertRect:self.collectionViewFrameInCanvas fromView:self.collectionView];
        }
        CGRect leftRect = self.collectionViewFrameInCanvas;
        leftRect.size.width = 20.0;
        [self.hitTestRectagles setObject:[NSValue valueWithCGRect:leftRect] forKey:@"left"];
        CGRect rightRect = self.collectionViewFrameInCanvas;
        rightRect.origin.x = rightRect.size.width - 20.0;
        rightRect.size.width = 20.0;
        [self.hitTestRectagles setObject:[NSValue valueWithCGRect:rightRect] forKey:@"right"];
    }
}

@end
