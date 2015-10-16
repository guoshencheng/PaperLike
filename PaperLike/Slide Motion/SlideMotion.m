//
//  SlideMotion.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/15/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "SlideMotion.h"
#import "SlideMotion+Calculation.h"

@interface SlideMotion () <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIView *currentSlideView;
@property (nonatomic, assign) CGPoint gestureStartLocation;

@end


@implementation SlideMotion

#pragma mark - Object Lifecycle

- (id)init {
    if (self = [super init]) {
        _enabled = YES;
        _currentSlideView = nil;
        _direction = SlideMotionDirectionHorizontal;
    }
    return self;
}

#pragma mark - Public Methods

- (void)attachToView:(UIView *)view {
    for (UIGestureRecognizer *gestureRecognizer in view.gestureRecognizers) {
        if (gestureRecognizer.delegate == self && [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
            return; // skip if already attached
        }
    }
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:view action:nil];
    panRecognizer.delegate = self;
    [view addGestureRecognizer:panRecognizer];
}

- (void)detachFromView:(UIView *)view {
    for (UIGestureRecognizer *gestureRecognizer in view.gestureRecognizers) {
        if (gestureRecognizer.delegate == self && [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
            [view removeGestureRecognizer:gestureRecognizer];
            return;
        }
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.enabled && self.dataSource && [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer *)gestureRecognizer;
        if (![self shouldIgnoreGesture:gesture]) {
            [gestureRecognizer addTarget:self action:@selector(panGestureAction:)];
        }
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([self.delegate respondsToSelector:@selector(slideMotion:shouldReceiveTouch:forSlideView:)] && [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        return [self.delegate slideMotion:self shouldReceiveTouch:touch forSlideView:[gestureRecognizer view]];
    }
    return YES;
}

#pragma mark - PanGestureRecognizer Action

- (void)panGestureAction:(UIPanGestureRecognizer *)gesture {
    switch ([gesture state]) {
        case UIGestureRecognizerStateBegan:{
            [self panGestureDidBegin:gesture];
            break;
        }
            
        case UIGestureRecognizerStateChanged: {
            [self panGestureDidMove:gesture];
            break;
        }
            
        case UIGestureRecognizerStateEnded: {
            [self panGestureDidEnd:gesture];
            break;
        }
            
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStatePossible:
            [self panGestureDidEnd:gesture];
            break;
            
        default:
            break;
    }
}

- (void)panGestureDidBegin:(UIPanGestureRecognizer *)gesture {
    self.currentSlideView = [gesture view];
    if ([self.delegate respondsToSelector:@selector(slideMotion:willBeginSlideView:)]) {
        [self.delegate slideMotion:self willBeginSlideView:self.currentSlideView];
    }
    
    self.gestureStartLocation = [self locationOfGesture:gesture];
    
    if ([self.delegate respondsToSelector:@selector(slideMotion:didBeginSlideView:)]) {
        [self.delegate slideMotion:self didBeginSlideView:self.currentSlideView];
    }
}

- (void)panGestureDidMove:(UIPanGestureRecognizer *)gesture {
    CGFloat offset = [self offsetOfGesture:gesture fromLocation:self.gestureStartLocation];
    if ([self.delegate respondsToSelector:@selector(slideMotion:shouldSlideView:withOffset:)]) {
        // cacel motion if could not slide
        if (![self.delegate slideMotion:self shouldSlideView:self.currentSlideView withOffset:offset]) {
            [self panGestureDidEnd:gesture];
            return;
        }
    }
    if ([self.delegate respondsToSelector:@selector(slideMotion:didSlideView:withOffset:)]) {
        [self.delegate slideMotion:self didSlideView:self.currentSlideView withOffset:offset];
    }
}

- (void)panGestureDidEnd:(UIPanGestureRecognizer *)gesture {
    if ([self.delegate respondsToSelector:@selector(slideMotion:willEndSlideView:)]) {
        [self.delegate slideMotion:self willEndSlideView:self.currentSlideView];
    }
    
    [gesture removeTarget:self action:@selector(panGestureAction:)];
    
    if ([self.delegate respondsToSelector:@selector(slideMotion:didEndSlideView:)]) {
        [self.delegate slideMotion:self didEndSlideView:self.currentSlideView];
    }
    self.currentSlideView = nil;
}

@end
