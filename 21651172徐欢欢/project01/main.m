//
//  main.m
//  MyCalendar
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YearAndMonthNow.h"
#import "JudgeNumber.h"
#import "PrintCalendar.h"
#import "ComputeDays.h"

int main(int argc, const char * argv[]){
    @autoreleasepool{
        
        int year,mon;
        PrintCalendar *printMonthObj = [[PrintCalendar alloc] init];
        PrintCalendar *printYearObj = [[PrintCalendar alloc] init];
        if (argc == 2) {
            //1.执行“cal”命令；
            //执行该命令时argc = 2;argv[1] = cal;argv[2] = null
            //计算当前年月；
            YearAndMonthNow *yearAndMonthNow = [[YearAndMonthNow alloc] init];
            [yearAndMonthNow yearAndMonth];
            year = yearAndMonthNow.yearNow;
            mon = yearAndMonthNow.monthNow;
            
            [printMonthObj printmonth:year mon:mon];
        }
        else if(argc == 3){
            //4.执行“cal 2014”命令；
            //这个argv2表示年份；
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            [printYearObj printyear:[argv2 intValue]];
        }
        else if(argc == 4){
            //2.执行“cal 10 2014”命令；
            //这一步是为了把传递进来的char * argv参数转化为 OC中的NSString；
            //    NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            NSString *argv3 = [NSString stringWithUTF8String:argv[3]];
            JudgeNumber *judgeNumberRegex = [[JudgeNumber alloc] init];
            BOOL isMonthRegex = [judgeNumberRegex isNumber:argv2];
            BOOL isYearRegex = [judgeNumberRegex isNumber:argv3];
            
            if (isMonthRegex && isYearRegex) {
                //执行该命令时，argc = 4,argv[1] = cal,argv[2] = 10,argv[3] = 2014;
                //需要把数字字符串转化为整型；
                [printMonthObj printmonth:[argv3 intValue] mon:[argv2 intValue]];
            }
            else{
                //3.执行“cal -m 10”命令；
                //需要输出本年的10月份日历；
                //注意这里和上一个if的差异：这里的月份是在第三个参数的；
                YearAndMonthNow *yearAndMonthNow = [[YearAndMonthNow alloc] init];
                [yearAndMonthNow yearAndMonth];
                year = yearAndMonthNow.yearNow;
                [printMonthObj printmonth:year mon:[argv3 intValue]];
            }
        }
    }
    return 0;
}
