//
//  TaskListTableViewController.h
//  TaskList
//
//  Created by yinyipeng on 16/11/10.
//  Copyright © 2016年 snailset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskListModel.h"

@interface TaskListTableViewController : UITableViewController

@property (nonatomic) id<ListModel> taskList;

@end
