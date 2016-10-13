//
//  YearAndMonthNow.m
//  MyCalendar
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 admin. All rights reserved.
//



#import "YearAndMonthNow.h"
@implementation YearAndMonthNow

- (void) yearAndMonth{

    NSDate *data = [NSDate date];
    
    NSCalendar *cal = [NSCalendar currentCalendar];

    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;

    NSDateComponents *d = [cal components:unitFlags fromDate:data];
    
    _yearNow = (int) [d year];

    _monthNow = (int) [d month];
}
@end
