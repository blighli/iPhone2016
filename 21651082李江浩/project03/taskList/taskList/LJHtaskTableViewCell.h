//
//  LJHtaskTableViewCell.h
//  taskList
//
//  Created by 李江浩 on 2016/10/20.
//  Copyright © 2016年 李江浩. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  LJHtaskTableViewCellDelegate;
@interface LJHtaskTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (strong, nonatomic) id<LJHtaskTableViewCellDelegate> delegate;

@end

@protocol LJHtaskTableViewCellDelegate <NSObject>

- (void)finishedTaskTableViewCell:(LJHtaskTableViewCell *)cell;

@end
