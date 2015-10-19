//
//  CustomSelectViewController.m
//  PaperLike
//
//  Created by guoshencheng on 10/16/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "CustomSelectViewController.h"
#import "CustomSelectViewController+Configuration.h"

@implementation CustomSelectViewController

+ (instancetype)create {
    CustomSelectViewController *customSelectViewController = [[CustomSelectViewController alloc] initWithNibName:@"CustomSelectViewController" bundle:nil];
    return customSelectViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)didClickDoneButton:(id)sender {
    
}

#pragma mark - PickUpMotionDataSource

- (UIView *)containerViewOfPickUpmotion:(PickUpMotion *)pickUpmotion {
    return self.view;
}

- (CGRect)pickUpmotion:(PickUpMotion *)pickUpmotion frameOfView:(UIView *)view {
    return [self.selectionCollectionView convertRect:view.frame toView:self.view];
}

@end
