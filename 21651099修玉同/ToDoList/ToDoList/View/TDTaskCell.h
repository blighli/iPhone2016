//
//  TDTaskCell.h
//  ToDoList
//
//  Created by soulghost on 24/10/2016.
//  Copyright © 2016 soulghost. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDTask;

@interface TDTaskCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) TDTask *task;

@end
