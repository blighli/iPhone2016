//
//  TaskListTableViewController.h
//  Task List
//
//  Created by 戈宇泽 on 16/10/16.
//  Copyright © 2016年 戈宇泽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "head.h"

@interface TaskListTableViewController : UITableViewController
<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *taskList;

@property (nonatomic, strong) UIButton *insertButton;

@property (nonatomic, weak) UITextField *textField;
@end
