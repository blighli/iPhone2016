﻿//
//  CalendarCell.m
//  CalendarPicker
//
//  Created by LZF on 16/10/26.
//  Copyright © 2016年 LZF. All rights reserved.
//

#import "CalendarCell.h"

@implementation CalendarCell
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _dateLabel.font = [UIFont fontWithName:@"Courier" size:20];
        [self addSubview:_dateLabel];
    }
    return _dateLabel;
}
@end
