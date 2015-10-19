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
#import "HomeViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen bounds]];
//    CustomSelectViewController *customSelectViewController = [CustomSelectViewController create];
    HomeViewController *homeViewController = [HomeViewController create];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    self.navigationController.navigationBarHidden = YES;
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
