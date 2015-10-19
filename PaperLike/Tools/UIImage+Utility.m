//
//  UIImage+Utility.m
//  Vibin
//
//  Created by Sherlock on 3/20/14.
//  Copyright (c) 2014 Vibin, Ltd. All rights reserved.
//

#import "UIImage+Utility.h"

@implementation UIImage (Utility)

+ (UIImage *)imageWithView:(UIView *)view {
  return [self imageWithView:view size:view.bounds.size];
}

+ (UIImage *)imageWithView:(UIView *)view size:(CGSize)size {
  UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
  [view.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return image;
}

+ (UIImage *)staticPlaceholderImage {
  static UIImage *placeholderImage = nil;
  if (!placeholderImage) {
    placeholderImage = [UIImage imageNamed:@"ico_friend_profile.png"];
  }
  
  return placeholderImage;
}

- (UIImage *)rotateAndScaleWithRatio:(CGFloat)ratio {
  CGSize newSize = CGSizeMake(self.size.width * ratio, self.size.height * ratio);
  
  UIGraphicsBeginImageContext(newSize);   // a CGSize that has the size you want
	[self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}


@end
