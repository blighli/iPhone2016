//
//  calendarCalculate.m
//  Calender
//
//  Created by 李林 on 16/10/2.
//  Copyright © 2016年 lilin. All rights reserved.
//

#import "calendarCalculate.h"

@implementation calendarCalculate


+ (void)printCalendarByDate:(NSDate *)inputDate
{
    // 计算三个参数：月份，星期，一个月总共多少天
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *component = [[NSDateComponents alloc] init];
    
    unsigned unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday ;
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:inputDate];
    component = [calendar components:unitFlag fromDate:inputDate];
    
    // 获取的数据
    int year = (int)component.year;
    int month = (int)component.month;
    int day = (int)component.day;
    int week = (int)component.weekday - 1;
    int dayOfMonth = range.length;
    
    printf("       %d %d\n", month, year);
    printf(" Su Mo Tu We Th Fr Sa\n");
    
    // 显示数据
    for(int i=0; i<3*week; i++) printf(" ");
    
    // 用来标记今天星期几。
    int index = 1;
    while(index <= dayOfMonth){
        printf(" %2d", index);
        
        week++;
        if(week%7==0)  printf("\n");
        
        index++;
    }
    printf("\n");
}


+ (void)allocCalendar:(NSString *)cal
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSDate *date = [formatter dateFromString:cal];
    
    [calendarCalculate printCalendarByDate:date];
}

+ (void)allocYearCalendar:(NSString *)cal
{
    for(int i=1; i<=12; i++){
        NSString *str = [NSString stringWithFormat:@"-%02d", i];
        [calendarCalculate allocCalendar:[cal stringByAppendingString:str]];
    }
}

@end
