//
//  AppDelegate.h
//  TaskList
//
//  Created by Envaka on 16/10/26.
//  Copyright © 2016年 Envaka. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

-(void)addTask:(id)sender;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *controller;

@end

