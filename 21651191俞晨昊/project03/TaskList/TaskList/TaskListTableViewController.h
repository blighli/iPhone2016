//
//  TaskListTableViewController.h
//  Created by ych.
//

#import <UIKit/UIKit.h>
#import "TaskListModel.h"

@interface TaskListTableViewController : UITableViewController

@property (nonatomic) id<ListModel> taskList;

@end
