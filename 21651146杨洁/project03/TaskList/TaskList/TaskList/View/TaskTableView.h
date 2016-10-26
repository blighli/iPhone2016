//
//  TaskTableView.h
//  TaskList
//
//  Created by soulghost on 17/10/2016.
//  Copyright © 2016 jyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TaskCell;
@class Task;

@interface TaskTableView : UITableView <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *tasks;

- (void)insertTask:(Task *)task;

@end
