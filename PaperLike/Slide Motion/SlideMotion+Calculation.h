//
//  SlideMotion+Calculation.h
//  ArchitectureProject
//
//  Created by guoshencheng on 6/15/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "SlideMotion.h"

@interface SlideMotion (Calculation)

- (CGPoint)locationOfGesture:(UIPanGestureRecognizer *)gesture;

- (CGFloat)offsetOfGesture:(UIPanGestureRecognizer *)gesture fromLocation:(CGPoint)startLocation;

- (BOOL)shouldIgnoreGesture:(UIPanGestureRecognizer *)gesture;

@end

