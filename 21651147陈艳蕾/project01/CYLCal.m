//
//  CYLCal.m
//  CYLCalendar
//
//  Created by sara on 16/10/8.
//  Copyright © 2016年 sara. All rights reserved.
//

#import "CYLCal.h"

@implementation CYLCal

-(void)calPrint:(NSMutableArray *)_cal
{
    printf(" Sun Mon Tue Wen Thr Fri Sat\n");
    for (NSMutableArray *week in _cal) {
        for (NSNumber *num in week) {
            int weekday = [num intValue];
            if(weekday == 0) {
                printf("%s","    ");
            }else if(weekday < 10){
                printf("   %i",weekday);
            }else{
                printf("  %i",weekday);
            }
        }
        printf("\n");
    }
}

-(NSMutableArray *)getCalByFirstDay:(int)_firstDay andDays:(int)_days
{
    NSMutableArray *myCal = [NSMutableArray arrayWithCapacity:6];
    
    int current_day = 1;
    for(int week =0 ; week < 6; week++){
        if (week == 0) {
            NSMutableArray *weekday = [NSMutableArray arrayWithCapacity:7];
            for(int i = 0; i < 7; i++){
                if (i < (_firstDay - 1)) {
                    [weekday addObject: [NSNumber numberWithInt:0]];
                }else
                {
                    [weekday addObject: [NSNumber numberWithInt:current_day]];
                    current_day += 1;
                }
            }
            [myCal addObject:weekday];
        }else
        {
            NSMutableArray *weekday = [NSMutableArray arrayWithCapacity:7];
            for (int i = 0; i < 7; i++) {
                if (current_day <= _days) {
                    [weekday addObject: [NSNumber numberWithInt:current_day]];
                    current_day += 1;
                }else{
                    [weekday addObject: [NSNumber numberWithInt:0]];
                }
            }
            [myCal addObject:weekday];
        }
    }
    return myCal;
}

-(void)printThisMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [NSDate date];
    NSDateComponents *compt = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date];
    
    NSInteger current_year = compt.year;//年
    NSInteger current_month = compt.month;//月
    printf("\n      %i月     %i年\n",(int)current_month,(int)current_year);
    
    //本月有多少天
    int days = (int)[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    //本月第一天是周几
    NSDate *f_date = [[NSDate alloc]init];
    [compt setDay:1];
    f_date = [calendar dateFromComponents:compt];
    NSDateComponents *f_compt = [calendar components:NSCalendarUnitWeekday fromDate:f_date];
    int f_day = (int)f_compt.weekday;
    
    [self calPrint:[self getCalByFirstDay:f_day andDays:days]];
}

-(void)printByYear:(int)_year
{
    printf("\n                                                    %i年\n\n",_year);
    
    NSMutableArray *allCal = [NSMutableArray arrayWithCapacity:4];
    for (int i = 1; i <= 4; i++) {
        NSMutableArray *semCal = [NSMutableArray arrayWithCapacity:3];
        for(int j = 1; j<= 3; j++){
            NSDateComponents *compt = [[NSDateComponents alloc]init];
            [compt setYear:_year];
            [compt setMonth:(j+(i-1)*3)];
            [compt setDay:1];
            
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSDate *date = [calendar dateFromComponents:compt];
            //当月有多少天
            int days = (int)[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
            //当月第一天是周几
            NSDateComponents *f_compt = [calendar components:NSCalendarUnitWeekday fromDate:date];
            int f_day = (int)f_compt.weekday;
            
            [semCal addObject:[self getCalByFirstDay:f_day andDays:days]];
        }
        [allCal addObject:semCal];
    }
    int month = 1;
    for (NSMutableArray *sem in allCal) {
        printf("               %i月                                    %i月                                    %i月\n",month,month+1,month+2);
        printf(" Sun  Mon  Tue  Wen  Thr  Fri  Sat     Sun  Mon  Tue  Wen  Thr  Fri  Sat      Sun  Mon  Tue  Wen  Thr  Fri  Sat\n");
        for (int l = 0; l < 6; l++) {
            for (NSMutableArray *myCal in sem) {
                NSMutableArray *week = [myCal objectAtIndex:l];
                for (NSNumber *num in week) {
                    int weekday = [num intValue];
                    if(weekday == 0) {
                        printf("%s","   ");
                    }else if(weekday < 10){
                        printf("  %i",weekday);
                    }else{
                        printf(" %i",weekday);
                    }
                    printf("  ");
                }
                printf("    ");
            }
            printf("\n");
        }
        month += 3;
    }
}

-(void)printByMonth:(int)_month andYear:(int)_year
{
    NSDateComponents *compt = [[NSDateComponents alloc]init];
    [compt setYear:_year];
    [compt setMonth:_month];
    [compt setDay:1];
    printf("\n      %i月     %i年\n",_month,_year);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [calendar dateFromComponents:compt];
    //当月有多少天
    int days = (int)[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    //当月第一天是周几
    NSDateComponents *f_compt = [calendar components:NSCalendarUnitWeekday fromDate:date];
    int f_day = (int)f_compt.weekday;
    
    [self calPrint:[self getCalByFirstDay:f_day andDays:days]];
    
    return;
}

@end
