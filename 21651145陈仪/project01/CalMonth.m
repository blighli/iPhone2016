//
//  CalMonth.m
//  CalPrint
//
//  Created by iOSChenYi on 16-10-2.
//  Copyright (c) 2016年 ChenYi. All rights reserved.
//

#import "CalMonth.h"

@implementation CalMonth

//计算一个月有多少天
- (NSUInteger) numOfDay
{
    NSCalendar *cal=[NSCalendar currentCalendar];
    
    NSDate *date=[self date];
    
    NSRange range=[cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSUInteger numOfDay=range.length;
    
    return numOfDay;
}

//计算每个月第一天是这一周的第几天。星期日为第一天，星期一为第二天，依此类推。
- (NSUInteger) weekDayOfFirstDay
{
    NSCalendar *cal=[NSCalendar currentCalendar];
    
    NSDate *firstDay=[self date];
    NSUInteger weekday=[cal ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:firstDay];
    
    return weekday;
}

//计算每个月第一天是一年中的第几天
- (NSUInteger) indexOfFirstDay
{
    NSCalendar *cal=[NSCalendar currentCalendar];
    
    NSDate *firstDay=[self date];
    NSUInteger index=[cal ordinalityOfUnit:NSDayCalendarUnit inUnit:NSYearCalendarUnit forDate:firstDay];
    
    return index;
}

- (id)init
{
    self=[super init];
    if(self)
    {
        NSDate *today=[NSDate date];
        NSCalendar *cal=[NSCalendar currentCalendar];
        
        //得到今天是哪一年哪一月。
        NSDateComponents *comps=[cal components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:today];
        
        [self setYear:[comps year]];
        [self setMonth:[comps month]];
        
        [self setLines];
    }
    return self;
}

- (id) initWithMonth:(NSUInteger) month withJFlag:(bool)flag
{
    self=[super init];
    if(self)
    {
        NSDate *today=[NSDate date];
        NSCalendar *cal=[NSCalendar currentCalendar];
        
        NSDateComponents *comps=[cal components:NSCalendarUnitYear fromDate:today];
        
        [self setYear:[comps year]];
        [self setMonth:month];
        [self setJFlag:flag];
        
        [self setLines];
    }
    return self;
}

- (id) initWithYear:(NSUInteger)year andMonth:(NSUInteger)month
{
    self=[super init];
    if(self)
    {
        [self setYear:year];
        [self setMonth:month];
        
        [self setLines];
    }
    return self;
}

//格式化输出这个月
- (NSString *) toString
{
    NSMutableString *output=[NSMutableString stringWithFormat:@""];
    
    NSArray *months=@[@"一", @"二", @"三",
                      @"四", @"五", @"六",
                      @"七", @"八", @"九",
                      @"十", @"十一", @"十二"];
    
    //设置第一行最前面的空白
    if ([self month]<=10) {
        [output appendFormat:@"     "];
    } else {
        [output appendFormat:@"    "];
    }
    [output appendFormat:@"%@月 %lu", [months objectAtIndex:[self month]-1], [self year]];
    
    [output appendFormat:@"\n日 一 二 三 四 五 六\n"];
    
    for(NSString *line in [self lines])
    {
        [output appendString:line];
    }
    //一个月可能输出只有五行数字，按照系统cal的习惯，必须有六行。
    if ([[self lines] count]<6) {
        [output appendString:@"\n"];
    }
    return output;
}

- (void) setLines
{
    //初始化lines
    _lines=[[NSMutableArray alloc] init];
    NSMutableString *output=[NSMutableString stringWithFormat:@""];
    
    unsigned long weekday=[self weekDayOfFirstDay];
    unsigned long index=[self indexOfFirstDay];
    unsigned long numOfDay=[self numOfDay];
    
    //初始化第一行最前面的空白。
    for(int i=0; i<weekday-1; ++i)
    {
        if([self jFlag])
        {
            [output appendString:@"    "];
        } else {
            [output appendString:@"   "];
        }
    }
    
    for(int i=1; i<=numOfDay; ++i, ++weekday)
    {
        if ([self jFlag]) {
            unsigned long num=i-1+index;
            if (num<10)
            {
                [output appendString:@"  "];
                
            } else if(num<100)
            {
                [output appendString:@" "];
            }
            [output appendFormat:@"%lu ", num];
        } else {
            //设置一位数前面的一个空格
            if (i<10) {
                [output appendString:@" "];
            }
            [output appendFormat:@"%d ", i];
        }
        
        //如果是一行中的最后一天，或者这个月的最后一天，将其后的空格改为换行符。
        if ((weekday % 7)==0 || i==numOfDay)
        {
            [output replaceCharactersInRange:NSMakeRange([output length]-1, 1) withString:@"\n"];
            [[self lines] addObject:[output copy]];
            [output setString:@""];
        }
    }
}

//返回这个月的第一天。
- (NSDate *) date
{
    NSCalendar *cal=[NSCalendar currentCalendar];
    
    NSDateComponents *comps=[[NSDateComponents alloc] init];
    [comps setYear:[self year]];
    [comps setMonth:[self month]];
    [comps setDay:1];
    
    return [cal dateFromComponents:comps];
}
@end
