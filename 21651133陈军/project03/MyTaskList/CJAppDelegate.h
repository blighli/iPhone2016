//
//  CJAppDelegate.h
//  MyTaskList
//
//  Created by Chanjun2016 on 16/10/26.
//  Copyright © 2016年 Chanjun2016. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface CJAppDelegate : UIResponder <UIApplicationDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

- (void)addTask: (id)sender;

@property (strong, nonatomic) UIWindow *window;

@end
