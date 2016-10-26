//
//  AppDelegate.h
//  TaskList
//
//  Created by Armas on 10/21/16.
//  Copyright © 2016 Armas. All rights reserved.
//

#import <UIKit/UIKit.h>

//读取存储tasklist
NSString* docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)NSMutableArray* tasklist;

@end

