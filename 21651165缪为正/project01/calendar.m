//
//  calendar.m
//  project1
//
//  Created by 缪为正 on 16-10-4.
//  Copyright (c) 2016年 缪为正. All rights reserved.
//

#import "calendar.h"


@implementation calendar



- (id) init
{
    //设置月份格式
    _monthArray = [NSArray arrayWithObjects:@"month",@"一月",@"二月",@"三月",@"四月", @"五月",@"六月", @"七月",@"八月", @"九月",@"十月", @"十一月",@"十二月", nil];
    //每月的天数
    _none = [[NSNumber alloc] initWithInt:0];
    _jan = [[NSNumber alloc] initWithInt:31];
    _febLeap = [[NSNumber alloc] initWithInt:29];
    _febNotLeap = [[NSNumber alloc] initWithInt:28];
    _mar = [[NSNumber alloc] initWithInt:31];
    _apr = [[NSNumber alloc] initWithInt:30];
    _may = [[NSNumber alloc] initWithInt:31];
    _jun = [[NSNumber alloc] initWithInt:30];
    _jul = [[NSNumber alloc] initWithInt:31];
    _aug = [[NSNumber alloc] initWithInt:31];
    _sep = [[NSNumber alloc] initWithInt:30];
    _oco = [[NSNumber alloc] initWithInt:31];
    _nov = [[NSNumber alloc] initWithInt:30];
    _dec = [[NSNumber alloc] initWithInt:31];
    
    _daysOfMonth = [[NSMutableArray alloc] init];
    //设置周日历格式
    _weekdayArray = [NSArray arrayWithObjects:@"week",@"日",@"一",@"二",@"三", @"四",@"五", @"六", nil];
    
    _weekday = [[NSMutableString alloc] init];
    [_weekday appendString:[_weekdayArray objectAtIndex:1]];
    for (int i=2; i<8; i++) {
        [_weekday appendFormat:@" "];
        [_weekday appendString:[_weekdayArray objectAtIndex:i]];
    }
    

    
    return self;
}

- (void) printYearAndMonthNow
{
    NSDate *now = [NSDate date];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *comps=[[NSDateComponents alloc] init];
//    [comps setYear:2016];
//    [comps setMonth:10];
//    [comps setDay:1];
//    NSDate *firstDay = [cal dateFromComponents:comps];
   
    comps = [cal components:(NSYearCalendarUnit) fromDate:now];
    _yearNow= [comps year];
    comps = [cal components:(NSMonthCalendarUnit) fromDate:now];
    _monthNow = [comps month];
    
//    NSUInteger witchday = [cal ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:firstDay];
}

- (void) printYear:(int)year AndMonth:(int)month;
{
    //判断是否闰年
    if ([self isLeapYear:year]) {
        NSArray *arr = [[NSArray alloc] initWithObjects:_none,_jan,_febLeap,_mar,_apr,_may,_jun,_jul,_aug,_sep,_oco,_nov,_dec, nil];
        [_daysOfMonth addObjectsFromArray:arr];
        
    } else {
        NSArray *arr = [[NSArray alloc] initWithObjects:_none,_jan,_febNotLeap,_mar,_apr,_may,_jun,_jul,_aug,_sep,_oco,_nov,_dec, nil];
        [_daysOfMonth addObjectsFromArray:arr];
    }
    //输出年月以及周天数格式
    //计算标题的长度
    NSMutableString *line = [[NSMutableString alloc] init];
    NSString *yearStr = [NSString stringWithFormat:@"%i",year];
    NSInteger monthLength = (month + 19)/10;
    //在每一行前面插入空格使得年月居中
    for (int i=0; i<(20-monthLength*2-1-[yearStr length])/2; i++) {
        [line appendFormat:@" "];
    }
    [line appendString:[_monthArray objectAtIndex:(int)month]];
    [line appendFormat:@" %i",year];
    //输出年月
    NSLog(@"%@",line);
    //输出周
    NSLog(@"%@",_weekday);
    
    //输出每一行的日期
    //计算这个月第一天是星期几
    NSUInteger witchday = [self days:month];
    //第一行插入空格
    [line setString:@""];
    for (int i=0; i<(witchday-1)*3; i++) {
        [line appendFormat:@" "];
    }
    //按行输出每一个日期
    for (int i=1; i<=[[_daysOfMonth objectAtIndex:month] intValue]; i++) {
        if (i<10) {
            [line appendFormat:@" %i",i];
        }
        else{
            [line appendFormat:@"%i",i];
        }
        //每个周六结束一行并输出
        if ((i+(int)witchday-1)%7==0) {
            NSLog(@"%@",line);
            [line setString:@""];
        }
        else{
            [line appendFormat:@" "];
        }
    }
    NSLog(@"%@",line);
    
    
}

- (void) printYear:(int)year
{
    //判断是否闰年
    if ([self isLeapYear:year]) {
        NSArray *arr = [[NSArray alloc] initWithObjects:_none,_jan,_febLeap,_mar,_apr,_may,_jun,_jul,_aug,_sep,_oco,_nov,_dec, nil];
        [_daysOfMonth addObjectsFromArray:arr];
        
    } else {
        NSArray *arr = [[NSArray alloc] initWithObjects:_none,_jan,_febNotLeap,_mar,_apr,_may,_jun,_jul,_aug,_sep,_oco,_nov,_dec, nil];
        [_daysOfMonth addObjectsFromArray:arr];
    }
    //输出标题
    //计算标题的长度
    NSMutableString *line = [[NSMutableString alloc] init];
    NSString *yearStr = [NSString stringWithFormat:@"%i",year];
    //在每一行前面插入空格使得年份居中
    for (int i=0; i<(64-[yearStr length])/2; i++) {
        [line appendFormat:@" "];
    }
    [line appendFormat:@"%i",year];
    //输出年
    NSLog(@"%@",line);
    NSLog(@" ");
    
    //输出月份日期
    //按季度输出
    for (int s=0; s<4; s++) {
        //输出月份
        [line setString:@""];
        [line appendFormat:@"        %@                  %@                 %@",[_monthArray objectAtIndex:1+s*3],[_monthArray objectAtIndex:2+s*3],[_monthArray objectAtIndex:3+s*3]];
        NSLog(@"%@",line);
        
        //输出周
        [line setString:@""];
        [line appendFormat:@"%@  %@  %@",_weekday,_weekday,_weekday];
        NSLog(@"%@",line);
        
        //计算这3个月第一天是星期几
        NSMutableArray *witchday = [[NSMutableArray alloc] init];
        NSNumber *num = [NSNumber numberWithInt:[self days:1+s*3]];
        [witchday addObject:num];
        num = [NSNumber numberWithInt:[self days:2+s*3]];
        [witchday addObject:num];
        num = [NSNumber numberWithInt:[self days:3+s*3]];
        [witchday addObject:num];
        
        //创建3个月的日期数组
        NSMutableArray *daysArray = [[NSMutableArray alloc] init];
        num = [NSNumber numberWithInt:1];
        [daysArray addObject:num];
        num = [NSNumber numberWithInt:1];
        [daysArray addObject:num];
        num = [NSNumber numberWithInt:1];
        [daysArray addObject:num];
        
        
        //插入第一行
        [line setString:@""];
        for (int m=0; m<3; m++) {
            
            //这个月的日期
            NSInteger day = [[daysArray objectAtIndex:m] integerValue];
            //这个月的第一天的星期数
            NSInteger wday = [[witchday objectAtIndex:m] integerValue];
            //插入空格
            for (int i=0; i<(wday-1)*3; i++) {
                [line appendFormat:@" "];
            }
            //每个周六结束这个月的日期输出
            for (; ((int)day+wday-1)%7!=0; day=day+1) {
                //输出一周的日期
                if ((int)day<10) {
                    [line appendFormat:@" %i ",(int)day];
                }
                else{
                    [line appendFormat:@"%i ",(int)day];
                }
            }
            //输出周六
            if ((int)day<10) {
                [line appendFormat:@" %i  ",(int)day];
            }
            else{
                [line appendFormat:@"%i  ",(int)day];
            }
            day=day+1;
            //记录当前日期
            [daysArray replaceObjectAtIndex:m withObject:[NSNumber numberWithInt:(int)day]];
        }
        NSLog(@"%@",line);
        //每一行3个月日期依次输出
        //只有3个月所有日期都输出完毕才结束循环
        for (int l=0; l<5; l++) {
            [line setString:@""];
            for (int m=0; m<3; m++) {
                //这个月的日期
                NSInteger day = [[daysArray objectAtIndex:m] integerValue];
                //这个月的第一天的星期数
                NSInteger wday = [[witchday objectAtIndex:m] integerValue];
                //每个周六结束这个月的日期输出
                for (; ((int)day+wday-1)%7!=0; day=day+1) {
                    //输出一周的日期
                    if ((int)day<10) {
                        [line appendFormat:@" %i ",(int)day];
                    }
                    else if ((int)day <= [[_daysOfMonth objectAtIndex:m+1+s*3] intValue ]){
                        [line appendFormat:@"%i ",(int)day];
                    }else{
                        [line appendFormat:@"   "];
                    }
                }
                //输出周六
                if ((int)day<10) {
                    [line appendFormat:@" %i  ",(int)day];
                }
                else if ((int)day <= [[_daysOfMonth objectAtIndex:m+1+s*3] intValue ]){
                    [line appendFormat:@"%i  ",(int)day];
                }else{
                    [line appendFormat:@"    "];
                }
                day=day+1;
                //记录当前日期
                [daysArray replaceObjectAtIndex:m withObject:[NSNumber numberWithInt:(int)day]];
            }
            NSLog(@"%@",line);
        }
    }
}

- (bool) isLeapYear:(int)year
{
    if (year%4==0) {
        if (year%400==0) {
            return YES;
        }else if (year%100==0){
            return NO;
        }else{
            return YES;
        }
    }else{
        return NO;
    }
}

- (int) days:(int)month
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    //计算这个月第一天是星期几
    NSDateComponents *comps=[[NSDateComponents alloc] init];
    [comps setYear:2016];
    [comps setMonth:month];
    [comps setDay:1];
    NSDate *firstDay = [cal dateFromComponents:comps];
    //本月1号的星期数
    NSInteger witchday = [cal ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:firstDay];
    
    return (int)witchday;
}

@end
