//
//  BottomCollectionView.m
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BottomCollectionView.h"
#import "UIScreen+Utility.h"

@implementation BottomCollectionView

- (void)layoutSubviews {
    [super layoutSubviews];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.itemSize = CGSizeMake([UIScreen screenWidth], self.frame.size.height);
    self.collectionViewLayout = layout;
}

@end
