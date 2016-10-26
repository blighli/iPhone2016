//
//  TableViewCell.m
//  TaskList
//
//  Created by LZF on 16/10/26.
//  Copyright © 2016年 LZF. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)taskFinished:(id)sender {
    //要删除这条记录，刷新tableView,通知delegate 调用方法
    [self.delegate finishedTaskTableViewCell:self];
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //[super setSelected:selected animated:animated];
    
    //Configure the view for the selected state
//}

@end
