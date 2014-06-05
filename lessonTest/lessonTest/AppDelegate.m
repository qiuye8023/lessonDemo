//
//  AppDelegate.m
//  lessonTest
//
//  Created by sky on 14-5-16.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WelcomeViewController.h"
#import "WebViewController.h"
#import "TestTableViewController.h"
#import "ActionSheetViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Override point for customization after application launch.
    [_window makeKeyAndVisible];
//    WelcomeViewController *welcomeVC=[[WelcomeViewController alloc] initWithNibName:@"WelcomeViewController" bundle:nil];
//    _window.rootViewController=welcomeVC;
    
//    WebViewController *webVC=[[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
//    _window.rootViewController=webVC;
    
    ViewController *vc=[[ViewController alloc] init];
    
    TestTableViewController *testTableVC=[[TestTableViewController alloc] initWithNibName:@"TestTableViewController" bundle:nil];
    UITabBarItem *item=[[UITabBarItem alloc] initWithTitle:@"标题" image:[UIImage imageNamed:@"0"] selectedImage:nil];
    [testTableVC setTabBarItem:item];
    
    ActionSheetViewController *actionSheetVC=[[ActionSheetViewController alloc] initWithNibName:@"ActionSheetViewController" bundle:nil];
    
//    UITabBar *tabbar=[[UITabBar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
//    [tabbar setItems:@[item]];
//    testTableVC.tabBarController;
    
//    UITabBarController *tabbarVC=[[UITabBarController alloc] init];
//    tabbarVC.viewControllers=@[vc,testTableVC];
    _window.rootViewController=actionSheetVC;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
