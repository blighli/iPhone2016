//
//  Days.m
//  project01
//
//  Created by Benjamin on 16/10/3.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "Days.h"

@implementation Days
/*
 闰年的判断：
 满足下列一个条件即可：
 1. 能被4整除但是不能被100整除；
 2. 能被400整除；
 */

//判断是否为闰年
+(BOOL)isLeapYear:(int)year{
    if((year%4==0 && year%100!=0)||(year%400==0)){
        return true;
    }else{
        return false;
    }
}

//计算从公元0年到你输入的上一年总共有多少天
+(int)daysOfUntilLastYear:(int)year{
    int day = 0;
    
    BOOL isLeap;
    
    for (int i = 1; i < year; i++) {
        //不同
        isLeap = [Days isLeapYear:i];
        
        if (isLeap) {
            day += 366;
        }else{
            day += 365;
        }
    }
    
    //NSLog(@"day=%d",day);
    return day;
}

//计算公元0年到你输入上个月共有多少天
+(int)daysOfUntilLastMonth:(int)year yue:(int)yue{
    //定义每月的天数
    NSNumber *none = [[NSNumber alloc] initWithInt:0];
    NSNumber *jan = [[NSNumber alloc] initWithInt:31];
    NSNumber *febLeap = [[NSNumber alloc] initWithInt:29];
    NSNumber *febNotLeap = [[NSNumber alloc] initWithInt:28];
    NSNumber *mar = [[NSNumber alloc] initWithInt:31];
    NSNumber *apr = [[NSNumber alloc] initWithInt:30];
    NSNumber *may = [[NSNumber alloc] initWithInt:31];
    NSNumber *jun = [[NSNumber alloc] initWithInt:30];
    NSNumber *jul = [[NSNumber alloc] initWithInt:31];
    NSNumber *aug = [[NSNumber alloc] initWithInt:31];
    NSNumber *sep = [[NSNumber alloc] initWithInt:30];
    NSNumber *oco = [[NSNumber alloc] initWithInt:31];
    NSNumber *nov = [[NSNumber alloc] initWithInt:30];
    NSNumber *dec = [[NSNumber alloc] initWithInt:31];
    
    //首先计算0年到上一年有多少天；
    int day=[Days daysOfUntilLastYear:year];
    
    //将输入年的月份做成数组
    NSMutableArray * monthArray=[[NSMutableArray alloc]init];
    
    if ([Days isLeapYear:year]) {
        NSArray *arr = [[NSArray alloc] initWithObjects:none,jan,febLeap,mar,apr,may,jun,jul,aug,sep,oco,nov,dec, nil];
        
        [monthArray addObjectsFromArray:arr];
    }else{
        NSArray *arr = [[NSArray alloc] initWithObjects:none,jan,febNotLeap,mar,apr,may,jun,jul,aug,sep,oco,nov,dec, nil];
        
        [monthArray addObjectsFromArray:arr];
    }
    
    for (int i = 1; i < yue; i++) {
        day += [[monthArray objectAtIndex:i]intValue];
    }
    
    return day;
}
@end
