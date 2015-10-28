//
//  RearrangeableCollectionViewFlowLayout.h
//  PaperLike
//
//  Created by guoshencheng on 10/22/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^FinishAnimationForCellMove)();
typedef void (^DeleteItemData)(NSIndexPath *indexPath);
typedef void (^MoveItemData)(NSIndexPath *fromIndexPath, NSIndexPath *toIndexPath);
typedef void (^AddItemData)(NSIndexPath *indexPath);

typedef void (^SendGestureBeganOut)(UILongPressGestureRecognizer *gesture);
typedef void (^SendGestureChangedOut)(UILongPressGestureRecognizer *gesture, CGPoint dragPointOnCanvas);
typedef void (^SendGestureEndedOut)(UILongPressGestureRecognizer *gesture, CGPoint dragPointOnCanvas);
typedef BOOL (^CheckIfBack)(CGPoint drag);

@interface Bundle : NSObject

@property (assign, nonatomic) CGPoint offset;
@property (strong, nonatomic) UICollectionViewCell *sourceCell;
@property (strong, nonatomic) UIView *representationImageView;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;

@end

typedef void (^SendIfShouldBeganGesture)(Bundle *bundle);
typedef void (^SendIfShouldFlyToOthers)();

@interface RearrangeableCollectionViewFlowLayout : UICollectionViewFlowLayout <UIGestureRecognizerDelegate>

@property (assign, nonatomic) BOOL animating;
@property (strong, nonatomic) UICollectionViewCell *publicSourceCell;
//@property (strong, nonatomic) NSIndexPath *currentIndexPath;
@property (assign, nonatomic) CGRect collectionViewFrameInCanvas;
@property (strong, nonatomic) NSMutableDictionary *hitTestRectagles;
@property (strong, nonatomic) UIView *canvas;
@property (strong, nonatomic) Bundle *bundle;
@property (strong, nonatomic) MoveItemData moveItemData;
@property (strong, nonatomic) SendGestureBeganOut sendGestureBeganOut;
@property (strong, nonatomic) SendGestureChangedOut sendGestureChangedOut;
@property (strong, nonatomic) SendGestureEndedOut sendGestureEndedOut;
@property (strong, nonatomic) SendIfShouldBeganGesture sendIfShouldBeganGesture;
@property (strong, nonatomic) SendIfShouldFlyToOthers sendIfShouldFlyToOthers;
@property (strong, nonatomic) AddItemData addItemData;
@property (strong, nonatomic) DeleteItemData deleteItemData;
@property (strong, nonatomic) CheckIfBack checkIfBack;
@property (strong, nonatomic) FinishAnimationForCellMove finishAnimationForCellMove;

- (void)publicHandleGestureBegan:(UILongPressGestureRecognizer *)gesture;
- (void)publicHandleGestureChanged:(UILongPressGestureRecognizer *)gesture dragPointOnCanvas:(CGPoint)dragPointOnCanvas;
- (void)publicHandleGestureEnded:(UILongPressGestureRecognizer *)gesture dragPointOnCanvas:(CGPoint)dragPointOnCanvas;
- (void)publicAnimationAddCell;

@end
