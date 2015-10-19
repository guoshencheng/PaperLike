//
//  CustomSelectViewController.h
//  PaperLike
//
//  Created by guoshencheng on 10/16/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSelectionListDatasource.h"
#import "CircleLayout.h"
#import "PickUpMotion.h"

@interface CustomSelectViewController : UIViewController <PickUpMotionDataSource, PickUpMotionDelegate>
@property (weak, nonatomic) IBOutlet UIView *topBarView;
@property (weak, nonatomic) IBOutlet UILabel *topBarTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *doneLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *selectedCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *selectionCollectionView;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *currentSelectionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentSelectionDiscriptionLabel;

@property (strong, nonatomic) NSObject *movedObject;
@property (assign, nonatomic) NSInteger movedIndex;
@property (strong, nonatomic) UIView *movedView;
@property (strong, nonatomic) CustomSelectionListDatasource *selectedListDatasource;
@property (strong, nonatomic) CustomSelectionListDatasource *selectionListDatasource;
@property (strong, nonatomic) CircleLayout *circleLayout;
@property (strong, nonatomic) PickUpMotion *pickUpMotion;

+ (instancetype)create;

@end
