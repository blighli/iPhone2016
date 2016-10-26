//
//  ZMCal.m
//  Cal_ZM
//
//  Created by zhanmin on 1/10/2016.
//  Copyright © 2016 zhanmin. All rights reserved.
//

#import "ZMCal.h"

@implementation ZMCal

+ (NSString *)calendarForDate:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // 计算该月天数
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSInteger dayLen = range.length;
    // 生成这个月的第一天date对象
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy MM";
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:date];
    NSString *firstDayStr = [NSString stringWithFormat:@"%04d %02d",(int)components.year, (int)components.month];
    NSDate *firstDay = [formatter dateFromString:firstDayStr];
    NSString *title = [formatter stringFromDate:date];
    components = [calendar components:NSCalendarUnitWeekday fromDate:firstDay];
    int weekDay = (int)components.weekday - 1;
    // 开始处理输出
    NSMutableString *ret = @"".mutableCopy;
    [ret appendFormat:@"      %@\nSu Mo Tu We Th Fr Sa\n", title];
    int currentDay = 1;
    int lineCount = 0;
    while (weekDay > 0) {
        weekDay--;
        lineCount++;
        [ret appendFormat:@"   "];
    }
    BOOL first = YES;
    while (lineCount < 7) {
        if (first) {
            first = NO;
            [ret appendFormat:@"%2d", currentDay];
        } else {
            [ret appendFormat:@" %2d", currentDay];
        }
        currentDay++;
        lineCount++;
    }
    lineCount = 0;
    [ret appendFormat:@"\n"];
    while (currentDay <= dayLen) {
        if (lineCount == 0) {
            [ret appendFormat:@"%2d", currentDay];
        }else {
            [ret appendFormat:@" %2d", currentDay];
        }
        lineCount++;
        currentDay++;
        if (lineCount == 7) {
            lineCount = 0;
            [ret appendFormat:@"\n"];
        }
    }
    return ret;
}

@end
