//
//  HomeViewController.m
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewController+Configuration.h"
#import "UIScreen+Utility.h"

@implementation HomeViewController

+ (instancetype)create {
    HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    return homeViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.backgroundCollectionView) {
        if (scrollView.contentOffset.x != self.bottomCollectionView.contentOffset.x) {
            [self.bottomCollectionView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0) animated:YES];
        }
    }
}

- (UIView *)containerViewOfSlideMotion:(SlideMotion *)slideMotion {
    return self.view;
}

- (void)slideMotion:(SlideMotion *)slideMotion willBeginSlideView:(UIView *)view {
    self.startSideOffset = self.bottomCollectionViewBottomConstraint.constant;
}

- (void)slideMotion:(SlideMotion *)slideMotion didSlideView:(UIView *)view withOffset:(CGFloat)offset {
    self.bottomCollectionViewBottomConstraint.constant = self.startSideOffset - offset;
    [self.view layoutIfNeeded];
}

- (void)slideMotion:(SlideMotion *)slideMotion didEndSlideView:(UIView *)view {
    if (self.bottomCollectionViewBottomConstraint.constant > [UIScreen screenHeight] * 2 / 3) {
//        [self animateToFullScreen];
        self.bottomCollectionView.pagingEnabled = YES;
    } else {
        self.bottomCollectionView.pagingEnabled = NO;
//        [self animateToRecover];
    }
}

- (void)animateToFullScreen {
    [UIView animateWithDuration:0.2 animations:^{
        self.bottomCollectionViewBottomConstraint.constant = [UIScreen screenHeight];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}


- (void)animateToRecover {
    [UIView animateWithDuration:0.2 animations:^{
        self.bottomCollectionViewBottomConstraint.constant = [UIScreen screenWidth] * (51.0 / 64);
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

@end
