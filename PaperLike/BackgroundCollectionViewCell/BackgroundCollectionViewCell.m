//
//  BackgroundCollectionViewCell.m
//  PaperLike
//
//  Created by guoshencheng on 10/19/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BackgroundCollectionViewCell.h"

@interface BackgroundCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation BackgroundCollectionViewCell

- (void)updateWithImage:(UIImage *)image {
    self.backgroundImageView.image = image;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
