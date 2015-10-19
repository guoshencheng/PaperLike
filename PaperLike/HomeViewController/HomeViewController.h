//
//  HomeViewController.h
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//


#import "BackgroundCollectionViewDatasource.h"
#import "BottomCollectionViewDatasource.h"
#import "SlideMotion.h"
#import "BottomCollectionView.h"

@interface HomeViewController : UIViewController <UICollectionViewDelegate, SlideMotionDataSource, SlideMotionDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *backgroundCollectionView;
@property (weak, nonatomic) IBOutlet BottomCollectionView *bottomCollectionView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomCollectionViewBottomConstraint;
@property (strong, nonatomic) BackgroundCollectionViewDatasource *backgroundCollectionViewDatasource;
@property (strong, nonatomic) BottomCollectionViewDatasource *bottomCollectionViewDatasource;
@property (strong, nonatomic) SlideMotion *slideMotion;
@property (assign, nonatomic) CGFloat startSideOffset;

+ (instancetype)create;

@end
