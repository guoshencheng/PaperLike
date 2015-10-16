//
//  AppDelegate.m
//  PaperLike
//
//  Created by guoshencheng on 10/16/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "AppDelegate.h"
#import "UIScreen+Utility.h"
#import "CustomSelectViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen bounds]];
    CustomSelectViewController *customSelectViewController = [CustomSelectViewController create];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:customSelectViewController];
    self.navigationController.navigationBarHidden = YES;
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
