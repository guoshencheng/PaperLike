//
//  PickUpMotion+Animation.h
//  Vibin
//
//  Created by Sherlock on 3/27/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import "PickUpMotion.h"

@interface PickUpMotion (Animation)

- (void)animateViewWithPickedView:(UIView *)pickedView completion:(void (^)(BOOL finished))completion;

- (void)fadeOutWithCompletion:(void (^)(BOOL finished))completion;
- (void)flyBackToView:(UIView *)view completion:(void (^)(BOOL finished))completion;
- (void)flyAwayFromView:(UIView *)view completion:(void (^)(BOOL finished))completion;

@end
