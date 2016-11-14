//
//  main.m
//  cal
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

// 天 一 二 三 四 五 六
//  1  2  3  4  5  6  7
//  8  9 10 11 12 13 14
// 15 16 17 18 19 20 21
// 22 23 24 25 26 27 28
// 29 30 31 32 33 34 35
// 36 37 38 39 40 41 42
// 43 44 45 46 47 48 49
#import <Foundation/Foundation.h>
#import "Month.h"
#import "string.h"
#import "MonthPrintManager.h"

#define IS_DIGIT(c) (((c) >= '0' && (c) <= '9') || (c) == '.')

// 获取月的天数
int getNumberOfDaysInMonth(NSDate * date);


// 获取指定的日期是星期几
int getWeekDayWithDate (NSDate * date);

// 打印一个月
void printOneMonth(int mon, int year, NSArray *arr);

// 打印一年
void printYear(int year, NSArray *arr);

// 字符串是否为数字
int isNumber(const char *str);

int getYear (const char *str);

int getMonth (const char *str);


int main(int argc, const char * argv[]) {
    
    
    NSArray *arr = @[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月",
                      @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"];
    
    int year = 0;
    int mon = 0;
    
    switch (argc) {
        case 1: {
            NSDate *date = [NSDate date];
            NSCalendar *cal = [NSCalendar currentCalendar];
            unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth;
            NSDateComponents *d = [cal components:unitFlags fromDate:date];
            // 当前年月
            year = (int)[d year];
            mon = (int)[d month];
            printOneMonth(mon, year, arr);
            break;
        }
        case 2: {
            // check year
            year = getYear(argv[1]);
            if (year != -1) {
                printYear(year, arr);
            }
            break;
        }
        case 3:
            // check year and month
            year = getYear(argv[2]);
            mon = getMonth(argv[1]);
            if (year != -1 && mon != -1) {
                printOneMonth(mon, year, arr);
            }
            break;
        default:
            // check arguments
            printf("usage: ./cal\n./cal year\n./cal month year\n");
            break;
    }
    
    return 0;
}

int getNumberOfDaysInMonth(NSDate * date)
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit: NSCalendarUnitMonth
                                  forDate:date];
    return (int)range.length;
}

int getWeekDayWithDate (NSDate * date)
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    
    // 1 是周日，2是周一 3.以此类推
    return (int)[comps weekday];
    
}


void printOneMonth(int mon, int year, NSArray *arr) {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString * str = [NSString stringWithFormat:@"%d-%d-01", year, mon];
    NSDate *date = [formatter dateFromString:str];
    int week = getWeekDayWithDate(date);
    int monthLength = getNumberOfDaysInMonth(date);
    
    Month* month = [Month monthWithStart:week end:monthLength+week-1 title: [NSString stringWithFormat:@"%@ %d", arr[mon-1], year]];
    
    MonthPrintManager* mpm = [[MonthPrintManager alloc] init];
    [mpm addMonth: month];
    [mpm setNumOfOneLine:3];
    [mpm print];
}

void printYear(int year, NSArray *arr) {
    MonthPrintManager* mpm = [[MonthPrintManager alloc] init];
    [mpm setNumOfOneLine:3];
    [mpm setTitle:[NSString stringWithFormat:@"%d", year]];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    for (int mon = 1; mon <= 12; mon ++) {
        NSString * str = [NSString stringWithFormat:@"%d-%d-01", year, mon];
        NSDate *date = [formatter dateFromString:str];
        int week = getWeekDayWithDate(date);
        int monthLength = getNumberOfDaysInMonth(date);
        Month* month = [Month monthWithStart:week end:monthLength+week-1 title: [NSString stringWithFormat:@"%@", arr[mon-1]]];
        [mpm addMonth: month];
    }
    [mpm print];
}

int isNumber(const char *str) {
    const char *ptr = str;
    if (*ptr == '.') {
        return 0;
    }
    
    while (*ptr != '\0') {
        if (!IS_DIGIT(*ptr)) {
            return 0;
        }
        ptr++;
    }
    return 1;
}

int getYear (const char *str) {
    if (!isNumber(str)) {
        printf("cal: year 0 not in range 1..9999\n");
        return -1;
    }
    int year = atoi(str);
    if (year < 1 || year > 9999 ) {
        printf("cal: year %s not in range 1..9999\n", str);
        return -1;
    }
    return year;
}

int getMonth (const char *str) {
    if (!isNumber(str)) {
        printf("cal: %s is neither a month number (1..12) nor a name\n", str);
        return -1;
    }
    int month = atoi(str);
    if (month < 1 || month > 12 ) {
        printf("cal: %s is neither a month number (1..12) nor a name\n", str);
        return -1;
    }
    return month;
}
