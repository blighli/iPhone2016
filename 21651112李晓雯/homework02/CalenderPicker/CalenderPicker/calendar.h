//
//  calendar.h
//  calendar
//
//  Created by li xiaowen on 16/9/29.
//  Copyright © 2016年 li xiaowen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calendar : NSObject

- (void)outputCurrentCalendar;//输出当前的日历
- (void)anotherOutputCalendarWithYear:(NSInteger)year;//输出某一年的日历
- (NSArray *)outputCalendarWithMonth:(NSInteger)month year:(NSInteger)year;//输出某年某月的日历
//- (NSArray *)outputCalendarWithMonth:(NSInteger)month year:(NSInteger)year;
@end
