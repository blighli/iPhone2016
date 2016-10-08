//
//  Days.m
//  test
//
//  Created by sally on 16/10/6.
//  Copyright © 2016年 sally. All rights reserved.
//

#import "Days.h"

@implementation Days

+ (BOOL) isLeap:(int)year {
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        return true;
    } else {
        return false;
    }
}

+ (int) daysUntilLastYear:(int)year {
    
    int day = 0;
    BOOL isLeap = false;
    
    for (int i = 1970; i < year; i ++) {
        isLeap  = [Days isLeap:i];
        if (isLeap) {
            day += 366;
        } else {
            day += 365;
        }
    }
    return day;
}

+ (int) daysUntilLastMonth : (int)year month:(int)month {
    
    NSNumber * none = [[NSNumber alloc] initWithInt:0];
    NSNumber * jan = [[NSNumber alloc] initWithInt:31];
    NSNumber * febLeap = [[NSNumber alloc] initWithInt:29];
    NSNumber * febNotLeap = [[NSNumber alloc] initWithInt:28];
    NSNumber * mar = [[NSNumber alloc] initWithInt:31];
    NSNumber * apr = [[NSNumber alloc] initWithInt:30];
    NSNumber * may = [[NSNumber alloc] initWithInt:31];
    NSNumber * jun = [[NSNumber alloc] initWithInt:30];
    NSNumber * jul = [[NSNumber alloc] initWithInt:31];
    NSNumber * aug = [[NSNumber alloc] initWithInt:31];
    NSNumber * sep = [[NSNumber alloc] initWithInt:30];
    NSNumber * oct = [[NSNumber alloc] initWithInt:31];
    NSNumber * nov = [[NSNumber alloc] initWithInt:30];
    NSNumber * dec = [[NSNumber alloc] initWithInt:31];
    
    int day = [Days daysUntilLastYear:year];
    
    NSMutableArray * monthArray = [[NSMutableArray alloc] init];
    
    if ([Days isLeap:year]) {
        NSArray * arr = [[NSArray alloc] initWithObjects:none,jan,febLeap,mar,apr,may,jun,jul,aug,sep,oct,nov,dec, nil];
        [monthArray addObjectsFromArray:arr];
    } else {
        NSArray * arr = [[NSArray alloc] initWithObjects:none,jan,febNotLeap,mar,apr,may,jun,jul,aug,sep,oct,nov,dec, nil];
        [monthArray addObjectsFromArray:arr];
    }
    
    for (int i = 1; i < month; i ++) {
        day += [[monthArray objectAtIndex:i] intValue];
    }
    
    return day;
}

@end
