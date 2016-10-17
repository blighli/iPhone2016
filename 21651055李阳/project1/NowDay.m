//
//  NowDay.m
//  MyCal
//
//  Created by 李阳 on 2016/10/8.
//  Copyright © 2016年 李阳. All rights reserved.
//

#import "NowDay.h"

@implementation NowDay
//获取年月日
-(void)yearAndMonth{
    NSDate *date=[NSDate date];
    
    NSCalendar * cal=[NSCalendar currentCalendar];
    
    unsigned int unitFlags=NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    
    //把要从date中获取的unitFlags标示的日期元素存放在NSDateComponents类型的d里面
    NSDateComponents *d=[cal components:unitFlags fromDate:date];
    
    _yearNow=(int)[d year];
    _monthNow=(int)[d month];
    
    //输出当前年月
    
}

@end
