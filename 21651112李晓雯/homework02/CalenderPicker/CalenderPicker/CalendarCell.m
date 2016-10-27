//
//  CalendarCell.m
//  CalendarPicker
//
//  Created by li xiaowen on 16/10/19.
//  Copyright © 2016年 li xiaowen. All rights reserved.
//

#import "CalendarCell.h"

@implementation CalendarCell
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
