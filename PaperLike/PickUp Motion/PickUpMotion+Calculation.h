//
//  PickUpMotion+Calculation.h
//  Vibin
//
//  Created by Sherlock on 3/27/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import "PickUpMotion.h"

typedef struct {
  PickUpMotionDirection verticalDirection;
  BOOL needDecelerateVertical;
  PickUpMotionDirection horizontalDirection;
  BOOL needDecelerateHorizontal;
} PickUpMotionDecelerateState;

@interface PickUpMotion (Calculation)

/**
 * The frame of view in the container area, usually its the origin picked up view
**/
- (CGRect)frameOfView:(UIView *)view;

/**
 * The new center position of view in the container area with a certain movement
**/
- (CGPoint)centerOfView:(UIView *)view withMovement:(CGPoint)movement;

/**
 * The new center position make the current motion view off screen with the direction against to the given view(usually the picked view)
**/
- (CGPoint)centerOutOfScreenAgainstView:(UIView *)view;

- (CGPoint)locationOfGesture:(UIPanGestureRecognizer *)gesture;

- (CGPoint)movementOfGesture:(UIPanGestureRecognizer *)gesture fromLocation:(CGPoint)startLocation;

- (CGPoint)decelerateMovement:(CGPoint)movement ofState:(PickUpMotionDecelerateState)decelerateState;

- (PickUpMotionDecelerateState)decelerateStateOfView:(UIView *)view withMovement:(CGPoint)movement;

- (BOOL)shouldIgnoreGesture:(UIPanGestureRecognizer *)gesture;

@end
