//
//  calendar.h
//  Mycal
//
//  Created by 李晓雯 on 16/10/5.
//  Copyright © 2016年 李晓雯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calendar : NSObject

- (BOOL)isNumber:(NSString *)str;
- (void)outputCurrentCalendar;//输出当前的日历
- (void)anotherOutputCalendarWithYear:(NSInteger)year;//输出某一年的日历
- (void)outputCalendarWithMonth:(NSInteger)month year:(NSInteger)year;//输出某年某月的日历

@end
