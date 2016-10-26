//
//  AppDelegate.h
//  CalendarShow
//
//  Created by Armas on 10/19/16.
//  Copyright © 2016 Armas. All rights reserved.
//

#import <UIKit/UIKit.h>
//读取存储tasklist
NSString* docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray* tasklist;
}

@property (strong, nonatomic) UIWindow *window;


@end

