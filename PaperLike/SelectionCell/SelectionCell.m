//
//  SelectionCell.m
//  PaperLike
//
//  Created by guoshencheng on 10/16/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "SelectionCell.h"

@interface SelectionCell ()

@property (weak, nonatomic) IBOutlet UIView *cardView;


@end

@implementation SelectionCell

- (void)awakeFromNib {
    self.cardView.layer.cornerRadius = 5;
}

@end
