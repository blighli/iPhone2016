//
//  main.m
//  Cal
//
//  Created by yangwj on 16/10/7.
//  Copyright © 2016年 yangwj. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Util.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if(argc == 3)
        {
            NSString * monthStr = [NSString stringWithUTF8String:argv[1]];
            NSString * yearStr = [NSString stringWithUTF8String:argv[2]];
            
            // 判断参数是否为数字
            NSString * yearTempStr = [yearStr stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
            if(yearTempStr.length > 0)
            {
                NSLog(@"year 0 not in range 1..9999");
                return 0;
            }
            NSString * monthTempStr = [monthStr stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
            if(monthTempStr.length > 0)
            {
                NSLog(@"%@ is neither a month number (1..12) nor a name", monthStr);
                return 0;
            }
            
            NSInteger year = [yearStr integerValue];
            NSInteger month = [monthStr integerValue];
            
            // 参数范围合法性判断
            if(year < 1 || year > 9999)
            {
                NSLog(@"year %d not in range 1..9999", year);
                return 0;
            }
            if(month < 1 || month > 12)
            {
                NSLog(@"%d is neither a month number (1..12) nor a name", month);
                return 0;
            }
            
            // 计算前置空格数量
            NSInteger yearLen = [[NSString stringWithFormat:@"%d",year] length];
            NSInteger monthLen = [[NSString stringWithFormat:@"%d",month-1] length];
            NSInteger len = monthLen * 2 + 3 + yearLen;
            NSInteger blankLen = (20 - len) / 2;
            NSMutableString * str = [[NSMutableString alloc]init];
            for(NSInteger i = 0; i < blankLen; i++)
            {
                [str appendString:@" "];
            }
            [str appendString:[Util monthtoChinese:month]];
            [str appendFormat:@" %d",year];
            NSLog(str);
            [Util printwithYear:year withMonth:month];
        }
        else if(argc == 2)
        {
            NSString * yearStr = [NSString stringWithUTF8String:argv[1]];
            // 判断参数是否为数字
            NSString * yearTempStr = [yearStr stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
            if(yearTempStr.length > 0)
            {
                NSLog(@"year 0 not in range 1..9999");
                return 0;
            }
            NSInteger year = [yearStr integerValue];
            // 参数范围合法性判断
            if(year < 1 || year > 9999)
            {
                NSLog(@"year %d not in range 1..9999", year);
                return 0;
            }
            
            // 计算前置空格数量
            NSMutableString * str = [[NSMutableString alloc]init];
            [str appendString:@"                             "];
            [str appendFormat:@"%d",year];
            NSLog(str);
            NSLog(@" ");
            [Util printwithYear:year];
        }
        else if(argc == 1)
        {
            NSDate * date = [NSDate date];
            NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
            NSDateComponents * comps = [calendar components:unitFlags fromDate:date];
            
            NSInteger year = [comps year];
            NSInteger month = [comps month];

            // 计算前置空格数量
            NSInteger yearLen = [[NSString stringWithFormat:@"%d",year] length];
            NSInteger monthLen = [[NSString stringWithFormat:@"%d",month-1] length];
            NSInteger len = monthLen * 2 + 3 + yearLen;
            NSInteger blankLen = (20 - len) / 2;
            NSMutableString * str = [[NSMutableString alloc]init];
            for(NSInteger i = 0; i < blankLen; i++)
            {
                [str appendString:@" "];
            }
            [str appendString:[Util monthtoChinese:month]];
            [str appendFormat:@" %d",year];
            NSLog(str);
            [Util printwithYear:year withMonth:month];
        }
    }
    return 0;
}





