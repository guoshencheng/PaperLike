//
//  PickUpMotion.h
//  Vibin
//
//  Created by Sherlock on 3/20/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
  PickUpMotionFreeStyle = 0,          // Motion can move every where (default)
  PickUpMotionVerticalStyle = 1,      // Motion can only move vertically
  PickUpMotionVerticalFreeStyle = 2,  // Motion can trigger by vertical pan but move freely
  PickUpMotionHorizontalStyle = 3,    // Motion can only move horizontally
  PickUpMotionHorizontalFreeStyle = 4,// Motion can trigger by horizontally pan but move freely
} PickUpMotionStyle;

typedef enum {
  PickUpMotionAnimationFade = 0,    // Fade off the motion view when end (default)
  PickUpMotionAnimationFlyBack = 1, // Fly the motion view back to the picked view locatoin when end
  PickUpMotionAnimationFlyAway = 2, // Fly the motion view away from the picked view locatoin when end
} PickUpMotionAnimationType;

typedef enum {
  PickUpMotionDirectionLeft = 0,
  PickUpMotionDirectionUp = 1,
  PickUpMotionDirectionRight = 2,
  PickUpMotionDirectionDown = 3,
} PickUpMotionDirection;

@protocol PickUpMotionDelegate;
@protocol PickUpMotionDataSource;

/**
 * This motion class is used when you need to hold touch on an UIView element to pick it up,
 * then panning around the screen with the element stick to your finger.
 *
 * The motion class will take a snapshot of current panning view to move this gesture,
 * which makes it looks like its stick to the finger.
**/
@interface PickUpMotion : NSObject

@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, strong) UIView *view; // the motion(snapshot) view
@property (nonatomic, weak) UIView *currentPickedView;
@property (nonatomic, assign) PickUpMotionStyle style;
@property (nonatomic, assign) PickUpMotionAnimationType animationType;

@property (nonatomic, weak) id<PickUpMotionDelegate> delegate;
@property (nonatomic, weak) id<PickUpMotionDataSource> dataSource;

/**
 * Attach this motion to the view that need to be picked up.
**/
- (void)attachToView:(UIView *)view;

/**
 * Manually end motion by fade out
**/
- (void)fadeOut;
/**
 * Manually end motion by fly back
 **/
- (void)flyBack;

@end


@protocol PickUpMotionDelegate <NSObject>

@optional
- (void)pickUpmotion:(PickUpMotion *)pickUpmotion willBeginMoveView:(UIView *)view;
- (void)pickUpmotion:(PickUpMotion *)pickUpmotion didBeginMoveView:(UIView *)view;
/**
 * @param movement: x > 0 move right; x < 0 move left; y > 0 move down; y < 0 move up;
**/
- (void)pickUpmotion:(PickUpMotion *)pickUpmotion didMoveView:(UIView *)view withMovement:(CGPoint)movement;
- (void)pickUpmotion:(PickUpMotion *)pickUpmotion willEndMoveView:(UIView *)view withMovement:(CGPoint)movement;
- (void)pickUpmotion:(PickUpMotion *)pickUpmotion didEndMoveView:(UIView *)view withMovement:(CGPoint)movement;

// this method checks whehter you need the pickup view doing decelerate on specific direction
- (BOOL)pickUpmotion:(PickUpMotion *)pickUpmotion shouldDecelerateView:(UIView *)view inDirection:(PickUpMotionDirection)direction;

- (CGFloat)pickUpmotion:(PickUpMotion *)pickUpmotion viewAlphaForMovement:(CGPoint)movement;
- (CGAffineTransform)pickUpmotion:(PickUpMotion *)pickUpmotion viewTransformForMovement:(CGPoint)movement;

@end


@protocol PickUpMotionDataSource <NSObject>

@required
/**
 * Should return the motion area view that the motion view can move around
**/
- (UIView *)containerViewOfPickUpmotion:(PickUpMotion *)pickUpmotion;

@optional
/**
 * Should return the frame of the given view in the container view
**/
- (CGRect)pickUpmotion:(PickUpMotion *)pickUpmotion frameOfView:(UIView *)view;

// default is 60
- (CGFloat)pickUpmotion:(PickUpMotion *)pickUpmotion maxDecelerateDistanceInDirection:(PickUpMotionDirection)direction;
// default is 200, bigger velocity means decelerate more slower
- (CGFloat)pickUpmotion:(PickUpMotion *)pickUpmotion decelerateVelocityInDirection:(PickUpMotionDirection)direction;

@end