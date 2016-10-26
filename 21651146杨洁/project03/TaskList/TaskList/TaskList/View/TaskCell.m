//
//  TaskCell.m
//  TaskList
//
//  Created by soulghost on 17/10/2016.
//  Copyright © 2016 jyoung. All rights reserved.
//

#import "TaskCell.h"
#import "Task.h"

@implementation TaskCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"TaskCell";
    [tableView registerClass:[TaskCell class] forCellReuseIdentifier:ID];
    return [tableView dequeueReusableCellWithIdentifier:ID];
}

- (void)setTask:(Task *)task {
    _task = task;
    self.textLabel.text = task.taskTitle;
}

@end
