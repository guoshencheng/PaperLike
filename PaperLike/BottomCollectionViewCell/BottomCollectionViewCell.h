//
//  BottomCollectionViewCell.h
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BOTTOM_COLLECTIONVIEW_CELL_ID @"BottomCollectionViewCell"
#define BOTTOM_COLLECTIONVIEW_CELL_NIBNAME @"BottomCollectionViewCell"

@interface BottomCollectionViewCell : UICollectionViewCell

- (void)updateWithImage:(UIImage *)image;

@end
