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
    self.imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.imageView.layer.shadowOffset = CGSizeMake(0, 0);
    self.imageView.layer.shadowOpacity = 1;
    self.imageView.layer.shadowRadius = 3;
}

- (void)updateWithImage:(UIImage *)image {
    self.imageView.image = image;
}

@end
