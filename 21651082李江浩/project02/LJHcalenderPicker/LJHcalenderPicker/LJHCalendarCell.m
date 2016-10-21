//
//  LJHCalendarCell.m
//  LJHCalendarPicker
//
//  Created by 李江浩 on 16/10/19.
//  Copyright © 2016年 李江浩. All rights reserved.
//

#import "LJHCalendarCell.h"

@implementation LJHCalendarCell
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:self.bounds];
        
        //[_dateLabel setTextAlignment:NSTextAlignmentCenter];
        //[_dateLabel setFont:[UIFont systemFontOfSize:17]];
        _dateLabel.font = [UIFont fontWithName:@"Courier" size:17];
        [self addSubview:_dateLabel];
    }
    return _dateLabel;
}
@end
