//
//  BottomContainerCollectionViewCell.h
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BottomContainerCollectionViewDatasource.h"

#define BOTTOM_CONTAINER_COLLECTIONVIEW_CELL_ID @"BottomContainerCollectionViewCell"
#define BOTTOM_CONTAINER_COLLECTIONVIEW_CELL_NIBNAME @"BottomContainerCollectionViewCell"

@interface BottomContainerCollectionViewCell : UICollectionViewCell <UICollectionViewDelegate>

@property (strong, nonatomic) BottomContainerCollectionViewDatasource *bottomContainerCollectionViewDatasource;

@end
