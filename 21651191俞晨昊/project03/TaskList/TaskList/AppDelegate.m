//
//  AppDelegate.m
//  Created by ych.
//

#import "AppDelegate.h"
#import "TaskListTableViewController.h"
#import "TaskListModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
	TaskListModel *taskListModel;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	TaskListTableViewController *taskListVC = [[TaskListTableViewController alloc] init];

	taskListModel = [[TaskListModel alloc] init];
	[taskListModel loadTaskList];//载入存储的数据
	taskListVC.taskList = taskListModel;
	
	UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:taskListVC];
	self.window.rootViewController = rootNav;
	[self.window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	
}


- (void)applicationWillTerminate:(UIApplication *)application {
	
	[taskListModel saveTaskList];//保存数据
}


@end
