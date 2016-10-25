//
//  TaskListTableViewController.h
//  TaskList
//
//  Created by 李剑 on 16/10/18.
//  Copyright © 2016年 mutouren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskListModel.h"

@interface TaskListTableViewController : UITableViewController

@property (nonatomic) id<ListModel> taskList;

@end
