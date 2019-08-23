//
//  TabBarController.m
//  AviaSearch
//
//  Created by Чернецова Юлия on 31/07/2019.
//  Copyright © 2019 Чернецов Роман. All rights reserved.
//

#import "TabBarController.h"
#import "MapViewController.h"
#import "MainViewController.h"
#import "TicketsViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController
- (instancetype) init{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        self.viewControllers = [self createViewControllers];
        self.tabBar.tintColor = [UIColor blackColor];
        self.selectedIndex = 0;
    }
    return self;
}
- (NSArray<UIViewController*> *)createViewControllers {
    
    NSMutableArray<UIViewController*> *controllers = [NSMutableArray new];
    MainViewController *mainViewController = [[MainViewController alloc] init];
    //mainViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Поиск" image:[UIImage imageNamed:@"search"] selectedImage:[UIImage imageNamed:@"search_selected"]];
    mainViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
    UINavigationController *mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    [controllers addObject:mainNavigationController];
    
    MapViewController *mapViewController = [[MapViewController alloc] init];
    //mapViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Карта цен" image:[UIImage imageNamed:@"map"] selectedImage:[UIImage imageNamed:@"map_selected"]];
    mapViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore
                                                                              tag:1];
    UINavigationController *mapNavigationController = [[UINavigationController alloc] initWithRootViewController:mapViewController];
    [controllers addObject:mapNavigationController];
  
    TicketsViewController *favoriteVC = [[TicketsViewController alloc] initFavoriteTicketController];
    favoriteVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:2];
    UINavigationController *favoriteNC = [[UINavigationController alloc] initWithRootViewController: favoriteVC];
    [controllers addObject:favoriteNC];
 
    return controllers;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
