//
//  Util.m
//  Cal
//
//  Created by yangwj on 16/10/7.
//  Copyright © 2016年 yangwj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Util.h"
#import "Tuple.h"

@implementation Util

+(void)printwithYear:(NSInteger)year
{
    @autoreleasepool {
        for(NSInteger i = 0; i < 4; i++)
        {
            NSMutableString * str = [[NSMutableString alloc]init];
            for(NSInteger month=1+3*i; month<4+3*i; month++)
            {
                // 计算前置空格数量
                NSInteger monthLen = [[NSString stringWithFormat:@"%d",month-1] length];
                // 考虑月份占位
                NSInteger len = monthLen * 2 + 2;
                NSInteger blankLen = (20 - len) / 2;
                
                for(NSInteger i = 0; i < blankLen; i++)
                {
                    [str appendString:@" "];
                }
                [str appendString:[Util monthtoChinese:month]];
                for(NSInteger i = 0; i < blankLen; i++)
                {
                    [str appendString:@" "];
                }
                // 方阵的间隙
                if(month != 3+3*i)
                    [str appendString:@"  "];
            }
            NSLog(str);
            NSLog(@"日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六");
            
            for(NSInteger k = 0; k < 6; k++)
            {
                [str setString:@""];
                for(NSInteger month=1+3*i; month<4+3*i; month++)
                {
                    Tuple * tuple = [Util tuplewithYear:year withMonth:month];
                    NSInteger monthLen = tuple.len;
                    NSInteger weekday = tuple.week;
                    
                    NSInteger begin;
                    if(k == 0)
                    {
                        begin = 1;
                    }
                    else{
                        begin = 7*k - weekday + 2;
                    }
                    NSString * subStr = [Util oneLinewithBegin:begin withWeekday:weekday withMax:monthLen];
                    [str appendString:subStr];
                    if([subStr length] < 20)
                    {
                        NSInteger num = 20 - [subStr length];
                        for(NSInteger m = 0; m < num; m++)
                        {
                            [str appendString:@" "];
                        }
                    }
                    
                    // 方阵的间隙
                    if(month != 3+3*i)
                        [str appendString:@"  "];
                }
                NSLog(str);
            }
        }
    }
}

+(void)printwithYear:(NSInteger)year withMonth:(NSInteger)month
{
    @autoreleasepool
    {
        NSLog(@"日 一 二 三 四 五 六");
        
        Tuple * tuple = [Util tuplewithYear:year withMonth:month];
        NSInteger monthLen = tuple.len;
        NSInteger weekday = tuple.week;
        
        NSInteger i = 1;
        for(NSInteger begin = 1; begin <= monthLen; i++)
        {
            NSString * str = [Util oneLinewithBegin:begin withWeekday:weekday withMax:monthLen];
            NSLog(str);
            begin = 7*i - weekday + 2;
        }
        if(i == 6)
        {
            NSLog(@"\n");
        }
    }
}

+(NSString *)oneLinewithBegin:(NSInteger)begin withWeekday:(NSInteger)weekday withMax:(NSInteger)max
{
    @autoreleasepool {
        NSMutableString * str = [[NSMutableString alloc]init];
        if(begin == 1)
        {
        // 添加前置空格
        for(NSInteger i = 1; i < weekday; i++)
        {
            [str appendString:@"   "];
        }
        for(NSInteger i = weekday; i < 8; i++)
        {
            if(begin < 10)
            {
                [str appendFormat:@" %d",begin];
            }
            else
            {
                [str appendFormat:@"%d",begin];
            }
            begin++;
            if(i != 7)
            {
                [str appendString:@" "];
            }
        }
        }
        else
        {
            for(NSInteger i = 1; i < 8 && begin <= max; i++)
            {
                if(begin < 10)
                {
                    [str appendFormat:@" %d",begin];
                }
                else
                {
                    [str appendFormat:@"%d",begin];
                }
                begin++;
                if(i != 7)
                {
                    [str appendString:@" "];
                }
            }

        }
        return str;
    }
}

+(NSString *)monthtoChinese:(NSInteger)num
{
    @autoreleasepool {
        NSArray * array = [NSArray arrayWithObjects:@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月", nil];
        return [array objectAtIndex:num-1];
    }
}

+(Tuple *)tuplewithYear:(NSInteger)year withMonth:(NSInteger)month
{
    @autoreleasepool {
        // 通过components构建date
        NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents * fromComps = [[NSDateComponents alloc] init];
        [fromComps setYear:year];
        [fromComps setMonth:month];
        [fromComps setDay:1];
        [fromComps setHour:12];
        [fromComps setMinute:0];
        NSDate *date = [calendar dateFromComponents:fromComps];
        
        // 获取某年某月的天数
        NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit
                                       inUnit: NSMonthCalendarUnit
                                      forDate:date];
        NSInteger monthLen = range.length;
        // NSLog(@"length: %1d", monthLen);
        
        // 通过date获取components，得到当月1号的星期数
        NSCalendarUnit unitFlags = NSCalendarUnitWeekday;
        NSDateComponents * toComps = [calendar components:unitFlags fromDate:date];
        NSInteger weekday = toComps.weekday;
        // NSLog(@"weekday %1d", weekday);
        
        Tuple * tuple = [[Tuple alloc]init];
        tuple.len = monthLen;
        tuple.week = weekday;
        return tuple;
    }
}
@end