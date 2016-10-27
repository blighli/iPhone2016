//
//  TaskListTableViewController.h
//  TaskList
//
//  Created by ax on 16/10/22.
//  Copyright © 2016年 aixing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "d.h"

@interface TaskListTableViewController : UITableViewController
<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *taskList;

@property (nonatomic, strong) UIButton *insertButton;

@property (nonatomic, weak) UITextField *textField;
@end
