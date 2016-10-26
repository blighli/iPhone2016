//
//  TaskTableView.m
//  TaskList
//
//  Created by soulghost on 17/10/2016.
//  Copyright © 2016 jyoung. All rights reserved.
//

#import "TaskTableView.h"
#import "TaskCell.h"
#import "Task.h"

@interface TaskTableView ()

@end

@implementation TaskTableView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.dataSource = self;
}

- (void)insertTask:(Task *)task {
    [self.tasks addObject:task];
    [self reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskCell *cell = [TaskCell cellWithTableView:tableView];
    cell.task = self.tasks[indexPath.row];
    return cell;
}

@end
