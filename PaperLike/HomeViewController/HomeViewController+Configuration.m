//
//  HomeViewController+Configuration.m
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+Configuration.h"
#import "CustomSelectViewController.h"
#import "BackgroundCollectionViewCell.h"
#import "BottomContainerCollectionViewCell.h"
#import "UIScreen+Utility.h"

@implementation HomeViewController (Configuration)

- (void)configureViews {
    [self configureBackgroundCollectionView];
    [self configureBottomCollectionView];
    [self configureSlideMotion];
}

- (void)configureBackgroundCollectionView {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.backgroundCollectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake([UIScreen screenWidth], [UIScreen screenHeight]);
    self.backgroundCollectionView.collectionViewLayout = layout;
    self.backgroundCollectionView.delegate = self;
    [self.backgroundCollectionView registerNib:[UINib nibWithNibName:BACKGROUND_COLLECTIONVIEW_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:BACKGROUND_COLLECTIONVIEW_CELL_ID];
    self.backgroundCollectionViewDatasource = [BackgroundCollectionViewDatasource new];
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressBackgroundCell:)];
    self.backgroundCollectionViewDatasource.backgroundCellConfigurationBlock = ^(NSIndexPath *indexPath, UICollectionViewCell *cell) {
        [cell addGestureRecognizer:gesture];
    };
    self.backgroundCollectionViewDatasource.datas = @[@"", @"", @""];
    self.backgroundCollectionView.dataSource = self.backgroundCollectionViewDatasource;
}

- (void)configureBottomCollectionView {
    self.bottomCollectionView.delegate = self;
    self.bottomCollectionViewBottomConstraint.constant = [UIScreen screenWidth] * (51.0 / 64);
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.bottomCollectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake([UIScreen screenWidth], [UIScreen screenWidth] * (51.0 / 64));
    self.bottomCollectionView.collectionViewLayout = layout;
    [self.bottomCollectionView registerNib:[UINib nibWithNibName:BOTTOM_CONTAINER_COLLECTIONVIEW_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:BOTTOM_CONTAINER_COLLECTIONVIEW_CELL_ID];
    self.bottomCollectionViewDatasource = [BottomCollectionViewDatasource new];
    self.bottomCollectionViewDatasource.datas = @[@"", @"", @""];
    self.bottomCollectionView.dataSource = self.bottomCollectionViewDatasource;
}

- (void)configureSlideMotion {
    self.slideMotion = [SlideMotion new];
    self.slideMotion.direction = SlideMotionDirectionVertical;
    self.slideMotion.delegate = self;
    self.slideMotion.dataSource = self;
    [self.slideMotion attachToView:self.bottomCollectionView];
}

- (void)longPressBackgroundCell:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        CustomSelectViewController *customSelectViewController = [CustomSelectViewController create];
        [self.navigationController pushViewController:customSelectViewController animated:YES];
    }
}

@end
