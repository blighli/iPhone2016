//
//  main.m
//  Project1
//
//  Created by Edward Lin on 2016/9/29.
//  Copyright © 2016年 Edward Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKCalendar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (strcmp(argv[1], "cal") != 0) {
            NSLog(@"\n-bash: %s: command not found", argv[1]);
        } else {

            JKCalendar *jkCalendar = [[JKCalendar alloc] init];
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSDate *currentDate = [NSDate date];
            NSDateComponents *components = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitWeekday fromDate:currentDate];

            if (argv[2] == NULL) {
                //输出当前月份的日历
                NSDate *firstDayOfMonth = [NSDate dateWithTimeIntervalSinceNow:(-24 * 60 * 60 *([components day] - 1))];    //得到当前月的第一天
                [jkCalendar printMonthCalendarWithFirstDayOfMonth:firstDayOfMonth];
            } else if (argv[3] == NULL) {
                //输出指定年份的日历
                int year = atoi(argv[2]);
                if (year < 1 || year > 9999) {      //判断年份是否符合要求
                    NSLog(@"\ncal: year %i not in range 1..9999", year);
                    return 0;
                }
                
                [jkCalendar printYearCalendarWithYear:year];
            } else if (argv[4] == NULL) {
                //输出指定年月的日历
                int month = atoi(argv[2]);
                int year = atoi(argv[3]);
                if (year < 1 || year > 9999) {              //判断年份是否符合要求
                    NSLog(@"\ncal: year %i not in range 1..9999", year);
                    return 0;
                } else if (month < 1 || month > 12) {       //判断月份是否符合要求
                    NSLog(@"\ncal: %s is neither a month number (1..12) nor a name", argv[2]);
                    return 0;
                }
                
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];       // 年-月-日 时:分:秒
                NSString *dateStr = [NSString stringWithFormat:@"%i-%i-01 12:00:00", year, month];  //指定日期    
                NSDate *firstDayOfMonth = [formatter dateFromString:dateStr];
                [jkCalendar printMonthCalendarWithFirstDayOfMonth:firstDayOfMonth];
            } else {
                NSLog(@"\nusage: cal [-jy] [[month] year]\n       cal [-j] [-m month] [year]\n       ncal [-Jjpwy] [-s country_code] [[month] year]\n       ncal [-Jeo] [year]");
            }
        }
    }
    return 0;
}

