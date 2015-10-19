//
//  PickUpMotion+Animation.m
//  Vibin
//
//  Created by Sherlock on 3/27/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import "PickUpMotion+Animation.h"
#import "PickUpMotion+Calculation.h"

@implementation PickUpMotion (Animation)

- (void)animateViewWithPickedView:(UIView *)pickedView completion:(void (^)(BOOL finished))completion {
  switch (self.animationType) {
    case PickUpMotionAnimationFlyBack:
      [self flyBackToView:pickedView completion:completion];
      break;
    
    case PickUpMotionAnimationFlyAway:
      [self flyAwayFromView:pickedView completion:completion];
      break;
      
    case PickUpMotionAnimationFade:
    default:
      [self fadeOutWithCompletion:completion];
      break;
  }
}

- (void)fadeOutWithCompletion:(void (^)(BOOL finished))completion {
  [UIView animateWithDuration:0.25 animations:^{
    self.view.alpha = 0;
  } completion:completion];
}

- (void)flyBackToView:(UIView *)view completion:(void (^)(BOOL finished))completion {
  CGPoint center = [self centerOfView:view withMovement:CGPointZero];
  [UIView animateWithDuration:0.25 animations:^{
    self.view.center = center;
    self.view.alpha = 1;
    self.view.transform = self.currentPickedView.transform;
  } completion:completion];
}

- (void)flyAwayFromView:(UIView *)view completion:(void (^)(BOOL finished))completion {
  CGPoint center = [self centerOutOfScreenAgainstView:view];
  [UIView animateWithDuration:0.25 animations:^{
    self.view.center = center;
  } completion:completion];
}

@end
