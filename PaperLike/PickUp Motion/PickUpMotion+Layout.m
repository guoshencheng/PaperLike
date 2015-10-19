//
//  PickUpMotion+Layout.m
//  Vibin
//
//  Created by Sherlock on 3/20/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import "PickUpMotion+Layout.h"
#import "PickUpMotion+Calculation.h"
#import "UIImage+Utility.h"

@implementation PickUpMotion (Layout)

#pragma mark - Public Methods

- (void)pickUpView:(UIView *)pickedView {
  [self removeView]; // remove old view if needed
  
  UIImage *snapshot = [UIImage imageWithView:pickedView];
  snapshot = [snapshot rotateAndScaleWithRatio:pickedView.transform.a];
  self.view = [[UIView alloc] initWithFrame:[self frameOfView:pickedView]];
  [self.view addSubview:[[UIImageView alloc] initWithImage:snapshot]];
  [self.view setBackgroundColor:pickedView.backgroundColor];
  [self.view.layer setMasksToBounds:YES];
  [[self.dataSource containerViewOfPickUpmotion:self] addSubview:self.view];
}

- (void)moveViewWithMovement:(CGPoint)movement fromPickedView:(UIView *)pickedView {
  self.view.center = [self centerOfView:pickedView withMovement:movement];
  if ([self.delegate respondsToSelector:@selector(pickUpmotion:viewAlphaForMovement:)]) {
    self.view.alpha = [self.delegate pickUpmotion:self viewAlphaForMovement:movement];
  }
    if ([self.delegate respondsToSelector:@selector(pickUpmotion:viewTransformForMovement:)]) {
        self.view.transform = [self.delegate pickUpmotion:self viewTransformForMovement:movement];
    }
}

- (void)removeView {
  if (self.view && self.view.superview) {
    [self.view removeFromSuperview];
  }
}

@end
