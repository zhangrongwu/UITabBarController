//
//  AppDelegate.m
//  UITabBarController_9.11
//
//  Created by chenTengfei on 14-9-11.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [_window release];
    
    UITabBarController *tabBarVC = [[UITabBarController alloc]init];
    
    // 创建几个视图控制器, 放到一个数组中
    OneViewController *oneVC = [[OneViewController alloc]init];
    oneVC.title = @"发现音乐";
    oneVC.tabBarItem.image = [UIImage imageNamed:@"iconfont-tianchengzuo.png"];
    
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    twoVC.title = @"我的音乐";
    
    //利用系统提供的图标, 系统的就不能改变
    twoVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1000];
    
    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    threeVC.title = @"朋友";
    
    
    FourViewController *fourVC = [[FourViewController alloc] init];
    fourVC.title = @"账号";
    
    
    FiveViewController *fiveVC = [[FiveViewController alloc] init];
    
    // 设置图片不可改变
    UIImage *selectedImage = [UIImage imageNamed:@"iconfont-liebiao.png"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置显示图片,选中图片
    fiveVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"更多" image:[UIImage imageNamed:@"iconfont-liebiao.png"] selectedImage:selectedImage];
    
//    SixViewController *sixVC = [[SixViewController alloc] init];    //最多显示6个,多的会显示 More
    
    // Navigation和TabBar结合
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:oneVC];
    UINavigationController *naviVC1 = [[UINavigationController alloc] initWithRootViewController:twoVC];
    UINavigationController *naviVC2 = [[UINavigationController alloc] initWithRootViewController:threeVC];
    UINavigationController *naviVC3 = [[UINavigationController alloc] initWithRootViewController:fourVC];
    UINavigationController *naviVC4 = [[UINavigationController alloc] initWithRootViewController:fiveVC];
    
    NSArray *arr = [NSArray arrayWithObjects:naviVC, naviVC1, naviVC2, naviVC3, naviVC4, nil];
    
    //将数组放到UITabBarController
    tabBarVC.viewControllers = arr;
    
    // 颜色
    tabBarVC.tabBar.barTintColor = [UIColor blackColor];    //设置tabBar背景色

    tabBarVC.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"red22.png"];//设置选中tabBar按钮的背景图片
    tabBarVC.tabBar.tintColor = [UIColor blueColor];       //设置tabBar按钮颜色
    
    // 模糊效果
    tabBarVC.tabBar.translucent = NO;
    
    
    self.window.rootViewController = tabBarVC;
    [tabBarVC release];
    
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
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
