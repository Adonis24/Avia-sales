//
//  AppDelegate.m
//  AviaSearch
//
//  Created by Чернецова Юлия on 21/07/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MapViewController.h"
#import "TabBarController.h"
#import "NotificationCenter.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // ***********до 4 урока
//    CGRect windowFrame = [[UIScreen mainScreen] bounds];
//    self.window = [[UIWindow alloc] initWithFrame: windowFrame];
//
//    MainViewController *mainViewController = [[MainViewController alloc] init];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: mainViewController];
//
//    self.window.rootViewController = navigationController;
//    [self.window makeKeyAndVisible];
//
//    return YES;
  
    //********* 4 урок начало
//    CGRect windowFrame = [[UIScreen mainScreen] bounds];
//    self.window = [[UIWindow alloc] initWithFrame: windowFrame];
//
//    MapViewController *mapViewController = [[MapViewController alloc] init];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: mapViewController];
//
//    self.window.rootViewController = navigationController;
//    [self.window makeKeyAndVisible];
//
//    return YES;
    //******* 4 урок окончание
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame: windowFrame];
    TabBarController *tabBarController = [[TabBarController alloc] init];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"first_start"];
    [[NotificationCenter sharedInstance] registerService];
    return YES;

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end