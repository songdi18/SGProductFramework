//
//  AppDelegate.m
//  SGProductTemplate
//
//  Created by 宋迪 on 15/3/13.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.mainVC=[[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
    UINavigationController* mainNavi=[[UINavigationController alloc]initWithRootViewController:self.mainVC];
    self.window.rootViewController=mainNavi;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
