//
//  AppDelegate.h
//  homework_3
//
//  Created by aleafall on 16/10/22.
//  Copyright (c) 2016年 aleafall. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate,
UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskFiled;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

-(void)addTask:(id)sender;

@property (strong, nonatomic) UIWindow *window;


@end

