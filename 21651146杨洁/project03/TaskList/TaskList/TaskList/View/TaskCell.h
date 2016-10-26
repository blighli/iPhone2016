//
//  TaskCell.h
//  TaskList
//
//  Created by soulghost on 17/10/2016.
//  Copyright © 2016 jyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Task;

@interface TaskCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) Task *task;


@end
