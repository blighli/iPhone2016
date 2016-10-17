//
//  calendar.h
//  calendar
//
//  Created by 李江浩 on 16/9/29.
//  Copyright © 2016年 李江浩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calendar : NSObject

- (void)outputCurrentCalendar;//输出当前的日历
- (void)outputCalendarWithYear:(NSInteger)year;//输出某一年的日历
- (void)anotherOutputCalendarWithYear:(NSInteger)year;//输出某一年的日历
- (void)outputCalendarWithMonth:(NSInteger)month year:(NSInteger)year;//输出某年某月的日历

@end
