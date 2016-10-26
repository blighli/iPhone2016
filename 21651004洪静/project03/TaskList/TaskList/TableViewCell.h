//
//  TableViewCell.h
//  TaskList
//
//  Created by 123 on 16/10/26.
//  Copyright © 2016年 Will. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  TableViewCellDelegate;
@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;

@property (strong, nonatomic) id<TableViewCellDelegate> delegate;

@end

@protocol TableViewCellDelegate <NSObject>

- (void)finishedTaskTableViewCell:(TableViewCell *)cell;


@end
