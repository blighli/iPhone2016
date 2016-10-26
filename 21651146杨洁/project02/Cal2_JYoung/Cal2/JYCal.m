//
//  Cal.m
//  Cal
//
//  Created by JYoung on 29/9/2016.
//  Copyright © 2016 JYoung. All rights reserved.
//

#import "JYCal.h"

@implementation JYCal

+ (NSDictionary *)getParamsFromDate:(NSDate *)date {
    NSMutableDictionary *params = @{}.mutableCopy;
    // 先使用NSCalendar获取到这一个月有多少天、这个月
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSInteger dayLen = range.length;
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy MM";
    // 拼接这个月第一天的字符串
    NSDateComponents *component = [calendar components:unitFlags fromDate:date];
    NSString *firstDayStr = [NSString stringWithFormat:@"%04d %02d",(int)component.year, (int)component.month];
    NSDate *firstDay = [formatter dateFromString:firstDayStr];
    component = [calendar components:unitFlags fromDate:firstDay];
    NSString *yearMonth = [formatter stringFromDate:date];
    NSInteger weekDay = [component weekday];
    params[@"title"] = yearMonth;
    params[@"dayLen"] = @(dayLen);
    params[@"weekday"] = @(weekDay);
    return params;
}

+ (NSString *)getCalStringWithDate:(NSDate *)date {
    NSMutableString *ret = @"".mutableCopy;
    NSDictionary *params = [self getParamsFromDate:date];
    NSString *title = params[@"title"];
    int dayLen = [params[@"dayLen"] intValue];
    int weekDay = [params[@"weekday"] intValue] - 1;
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
