//
//  RearrangeableCollectionViewFlowLayout.h
//  PaperLike
//
//  Created by guoshencheng on 10/22/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MoveItemData)(NSIndexPath *fromIndexPath, NSIndexPath *toIndexPath);

@interface Bundle : NSObject

@property (assign, nonatomic) CGPoint offset;
@property (strong, nonatomic) UICollectionViewCell *sourceCell;
@property (strong, nonatomic) UIView *representationImageView;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;

@end

@interface RearrangeableCollectionViewFlowLayout : UICollectionViewFlowLayout <UIGestureRecognizerDelegate>

@property (assign, nonatomic) BOOL animating;
@property (assign, nonatomic) CGRect collectionViewFrameInCanvas;
@property (strong, nonatomic) NSMutableDictionary *hitTestRectagles;
@property (strong, nonatomic) UIView *canvas;
@property (strong, nonatomic) Bundle *bundle;
@property (strong, nonatomic) MoveItemData moveItemData;

@end
