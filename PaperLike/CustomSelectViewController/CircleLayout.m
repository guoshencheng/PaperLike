//
//  CircleLayout.m
//  PaperLike
//
//  Created by guoshencheng on 10/16/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "CircleLayout.h"

@implementation CircleLayout

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(130, 270);
    CGFloat insert = (self.collectionView.frame.size.width - 130) * 0.5;
    self.minimumLineSpacing = 0;
    self.sectionInset = UIEdgeInsetsMake(0, insert, 0, insert);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *layoutAttributes = [[NSMutableArray alloc] init];
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        UICollectionViewLayoutAttributes *attrsCopy = [attrs copy];
        CGFloat delta = centerX - attrsCopy.center.x;
        CGFloat angle = atan(delta / (2 * self.collectionView.frame.size.width));
        CGFloat offsetY = (2 * self.collectionView.frame.size.width) * (1 - cos(angle));
        attrsCopy.transform = CGAffineTransformRotate(CGAffineTransformIdentity, - angle);
        attrsCopy.transform = CGAffineTransformTranslate(attrsCopy.transform, 0,offsetY);
        [layoutAttributes addObject:attrsCopy];
    }
    return layoutAttributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
