//
//  TaskListTableViewController.h
//  TaskList
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskListModel.h"

@interface TaskListTableViewController : UITableViewController

@property (nonatomic) id<ListModel> taskList;

@end
