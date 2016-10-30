//
//  AppDelegate.h
//  Project3
//
//  Created by Edward Lin on 2016/10/24.
//  Copyright © 2016年 Edward Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

