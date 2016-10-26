//
//  AppDelegate.m
//  TaskList
//
//  Created by Armas on 10/21/16.
//  Copyright © 2016 Armas. All rights reserved.
//

#import "AppDelegate.h"

NSString* docPath(){
    NSArray* pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    
    
    NSString* path = [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.txt"];
    
    NSLog(@"%@",path);
    return path;
}


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSArray* plist = [NSArray arrayWithContentsOfFile:docPath()];
    if(plist){
        self.tasklist = [plist mutableCopy];
    }else{
        self.tasklist = [[NSMutableArray alloc] init];
    }
    
    if([self.tasklist count] == 0){
        [self.tasklist addObject:@"Cat and dog"];
        [self.tasklist addObject:@"Killed by a woman"];
        [self.tasklist addObject:@"Fuck konws"];
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.tasklist writeToFile:docPath() atomically:YES];
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
