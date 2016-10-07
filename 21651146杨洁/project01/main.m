//
//  main.m
//  Cal
//
//  Created by soulghost on 29/9/2016.
//  Copyright © 2016 soulghost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cal.h"

NSString* getCalendarForYear(int year);
NSString* getCalendarForYearAndMonth(int year, int month);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *output = nil;
        switch (argc) {
            case 1: // 无参数，打印当前日期
                output = [Cal getCalStringWithDate:[NSDate date]];
                break;
            case 2: {// 年份
                int y = atoi(argv[1]);
                if (y < 1 || y >= 9999) {
                    printf("cal: year %d not in range 1..9999\n", y);
                    return -1;
                }
                output = getCalendarForYear(y);
                break;
            }
            case 3: {
                int m = atoi(argv[1]);
                int y = atoi(argv[2]);
                if ((y < 1 || y >= 9999)) {
                    printf("cal: year %d not in range 1..9999\n", y);
                    return -1;
                }
                if ((m < 1 || m > 12)) {
                    printf("cal: %d is not a month number (1..12)\n", m);
                    return -1;
                }
                output = getCalendarForYearAndMonth(y, m);
                break;
            }
            default:
                break;
        }
        printf("%s\n",output.UTF8String);
    }
    return 0;
}

NSString* getCalendarForYear(int year) {
    NSMutableString *ret = @"".mutableCopy;
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy MM";
    NSMutableArray *comps = @[].mutableCopy;
    for (int i = 1; i <= 12; i++) {
        NSString *dateStr = [NSString stringWithFormat:@"%04d %02d",year, i];
        NSDate *date = [formatter dateFromString:dateStr];
        [comps addObject:[Cal getCalStringWithDate:date]];
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

NSString* getCalendarForYearAndMonth(int year, int month) {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy MM";
    return [Cal getCalStringWithDate:[formatter dateFromString:[NSString stringWithFormat:@"%04d %02d", year, month]]];
}




