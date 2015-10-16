//
//  CustomSelectViewController.m
//  PaperLike
//
//  Created by guoshencheng on 10/16/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "CustomSelectViewController.h"
#import "CustomSelectViewController+Configuration.h"

@interface CustomSelectViewController ()

@end

@implementation CustomSelectViewController

+ (instancetype)create {
    CustomSelectViewController *customSelectViewController = [[CustomSelectViewController alloc] initWithNibName:@"CustomSelectViewController" bundle:nil];
    return customSelectViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)didClickDoneButton:(id)sender {
    
}

@end
