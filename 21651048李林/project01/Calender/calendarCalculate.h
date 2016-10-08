//
//  calendarCalculate.h
//  Calender
//
//  Created by 李林 on 16/10/2.
//  Copyright © 2016年 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calendarCalculate : NSObject

/**
 *  打印日期
 */
+ (void)printCalendarByDate:(NSDate *)inputDate;

/**
 *  分配打印
 */
+ (void)allocCalendar:(NSString *)cal;

/**
 *  一年分配打印
 */
+ (void)allocYearCalendar:(NSString *)cal;

@end
