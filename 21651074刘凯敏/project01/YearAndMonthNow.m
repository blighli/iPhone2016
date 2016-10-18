//
//  YearAndMonthNow.m
//  CalTest
//
//  Created by 刘凯敏 on 16/10/4.
//  Copyright © 2016年 Apress. All rights reserved.
//

/*
 这个类是获取当前的年份和月份；
 */

#import "YearAndMonthNow.h"

@implementation YearAndMonthNow

- (void) yearAndMonth{
    
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    //这句是说你要获取日期的元素有哪些。获取年就要写NSCalendarUnitYear，中间用|隔开；
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    //把要从date中获取的unitFlags标示的日期元素存放在NSDateComponents类型的d里面；
    NSDateComponents *d = [cal components:unitFlags fromDate:date];
    
    _yearNow = (int)[d year];
    _monthNow = (int)[d month];
    
    //  NSLog(@"%d",_yearNow);
    //  NSLog(@"%d",_monthNow);
}  

@end
