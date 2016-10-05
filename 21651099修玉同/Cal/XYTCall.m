//
//  XYTCall.m
//  Cal_XYT
//

//  Created by soulghost on 1/10/2016.
//  Copyright © 2016 xyt. All rights reserved.
//

#import "XYTCall.h"

@implementation XYTCall

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

+ (NSString *)calendarForYear:(int)year {
    NSMutableString *ret = @"".mutableCopy;
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy MM";
    NSMutableArray *comps = @[].mutableCopy;
    for (int i = 1; i <= 12; i++) {
        NSString *dateStr = [NSString stringWithFormat:@"%04d %02d",year, i];
        NSDate *date = [formatter dateFromString:dateStr];
        [comps addObject:[self calendarForDate:date]];
    }
    // 每三个月占一大行，每一小行都是这三个月的一小行拼接起来的
    // 一共3*4=12个月，因此循环4次
    for (int line = 0; line < 4; line++){
        // 对于每一行，取3个月的输出，按行拼接
        NSMutableArray<NSArray<NSString *> *> *calLines = @[].mutableCopy;
        NSInteger maxLineCount = 0;
        for (int i = line * 3; i < line * 3 + 3; i++) {
            // 按照回车符分割行
            NSArray *lines = [comps[i] componentsSeparatedByString:@"\n"];
            NSMutableArray *lines_temp = lines.mutableCopy;
            NSString *lastLine = [lines_temp lastObject];
            if (lastLine.length == 0) [lines_temp removeLastObject];
            for (NSInteger i = 1; i < lines_temp.count; i++) {
                NSString *str = lines_temp[i];
                NSInteger len = str.length;
                while (len < 20) {
                    str = [str stringByAppendingString:@" "];
                    len++;
                }
                lines_temp[i] = str;
            }
            lines = lines_temp;
            [calLines addObject:lines];
            if (lines.count > maxLineCount) {
                maxLineCount = lines.count;
            }
        }
        // 开始按照整行输出
        NSMutableString *line = @"".mutableCopy;
        // 对于这3个月每个月的每一行
        for (int l = 0; l < maxLineCount; l++) {
            BOOL first = YES;
            for (int m = 0; m < 3; m++) {
                NSArray *lines = calLines[m];
                if (l < lines.count) {
                    if (first) {
                        first = NO;
                        [line appendFormat:@"%@", lines[l]];
                    } else {
                        if (l == 0) { // 标题行，缩进更多
                            [line appendFormat:@"          %@", lines[l]];
                        } else {
                            NSString *lineToAppend = lines[l];
                            [line appendFormat:@"   %@", lineToAppend];
                            if (lineToAppend.length < 20) {
                                NSInteger delta = 20 - lineToAppend.length;
                                while(delta--) {
                                    [line appendString:@" "];
                                }
                            }
                        }
                    }
                } else {
                    [line appendString:@"                       "];
                }
            }
            [line appendString:@"\n"];
        }
        [ret appendFormat:@"%@\n", line];
    }
    return ret;
}

@end


