//
//  TDTaskCell.m
//  ToDoList
//
//  Created by soulghost on 24/10/2016.
//  Copyright © 2016 soulghost. All rights reserved.
//

#import "TDTaskCell.h"
#import "TDTask.h"

@implementation TDTaskCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"TaskCell";
    [tableView registerClass:[TDTaskCell class] forCellReuseIdentifier:ID];
    return [tableView dequeueReusableCellWithIdentifier:ID];
}

- (void)setTask:(TDTask *)task {
    _task = task;
    self.textLabel.text = task.taskTitle;
}

@end
