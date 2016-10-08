//  LFC专注
//  main.m
//  Calender
//
//  Created by 李林 on 16/10/2.
//  Copyright © 2016年 lilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "calendarCalculate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 模拟参数调试
//        argc = 2;
//        argv[2] = "2016";
        
        NSTimeInterval secondsPerDay = 24 * 60 * 60;
        switch (argc) {
            case 1:{
                // 将日期转为字符串传输
                NSDate *date = [[NSDate alloc] init];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"yyyy-MM"];
                NSString *printMonth = [formatter stringFromDate:date];
                
                [calendarCalculate allocCalendar:printMonth];
                break;
            }
            case 2:{        // 年份
                int year = atoi(argv[1]);
                NSString *printYear = [NSString stringWithFormat:@"%4d", year];
                
                [calendarCalculate allocYearCalendar:printYear];
                break;
            }
            case 3:{        // 年月
                int month = atoi(argv[1]);
                int year = atoi(argv[2]);
        
                NSString *printMonth = [NSString stringWithFormat:@"%4d-%02d", year, month];
                
                [calendarCalculate allocCalendar:printMonth];
                break;
            }
            default:
                break;
        }
    }
    return 0;
}
