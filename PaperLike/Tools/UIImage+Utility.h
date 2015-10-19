//
//  UIImage+Utility.h
//  Vibin
//
//  Created by Sherlock on 3/20/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utility)

/**
 * Capture UIView to UIImage
**/
+ (UIImage *)imageWithView:(UIView *)view;

/**
 * Capture UIView to UIImage with Size
 **/
+ (UIImage *)imageWithView:(UIView *)view size:(CGSize)size;

/**
 * return static image for friend profile placeholder image
 **/
+ (UIImage *)staticPlaceholderImage;

/**
 * !!Note: Somehow the image captured by device camera will be rotated,
 * this method can fix it to the correct position.
 *
 * @param ratio: ratio < 1 means make image smaller; ration > 1 means bigger
**/
- (UIImage *)rotateAndScaleWithRatio:(CGFloat)ratio;

@end
