//
//  AppDelegate.h
//  myCalendarApp
//
//  Created by 徐欢欢 on 16/10/26.
//  Copyright © 2016年 徐欢欢. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end
