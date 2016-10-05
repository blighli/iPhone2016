//
//  YearAndMonthNow.m
//  project01
//
//  Created by Benjamin on 16/10/3.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "YearAndMonthNow.h"

@implementation YearAndMonthNow
-(void)yearAndMonth{
    NSDate *date=[NSDate date];
    
    NSCalendar * cal=[NSCalendar currentCalendar];
    
    //获取年、月、日元素
    unsigned int unitFlags=NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    
    //把要从date中获取的unitFlags标示的日期元素存放在NSDateComponents类型的d里面
    NSDateComponents *d=[cal components:unitFlags fromDate:date];

    _yearNow=(int)[d year];
    _monthNow=(int)[d month];
    
    //输出当前年月
    //NSLog(@"year=%d,month=%d",_yearNow,_monthNow);
}

@end
