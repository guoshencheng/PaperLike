//
//  DragableFlowLayout.m
//  PaperLike
//
//  Created by guoshencheng on 10/22/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "DragableFlowLayout.h"

@implementation DragableFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(130, 270);
    self.minimumLineSpacing = 5;
}


@end
