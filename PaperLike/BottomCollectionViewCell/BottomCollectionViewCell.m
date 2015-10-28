//
//  BottomCollectionViewCell.m
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BottomCollectionViewCell.h"

@interface BottomCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end


@implementation BottomCollectionViewCell

- (void)awakeFromNib {
    self.layer.cornerRadius = 5;
}

- (void)updateWithImage:(UIImage *)image {
    self.imageView.image = image;
}

@end
