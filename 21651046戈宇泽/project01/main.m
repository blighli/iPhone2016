//
//  main.m
//  cal
//
//  Created by 戈宇泽 on 16/10/8.
//  Copyright © 2016年 戈宇泽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonthCalendar.h"
#import "YearCalendar.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSInteger monthCal[6][7]; //存放一个月历的所有日期
		NSInteger yearCal[24][21];//存放一个年历的所有日期
		if(argc == 1)
		{
			NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//日期格式控制器
			[dateFormatter setDateFormat:@"MM/YYYY"];
			NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
			//获取当前年、月
			NSArray *YM = [dateString componentsSeparatedByString:@"/"];
			[MonthCalendar initMonthCalendar:monthCal];
			MonthCalendar *monthCalendar = [[MonthCalendar alloc] initWithMonth:[YM[0] integerValue] AndYear:[YM[1] integerValue]];
			[monthCalendar printMonthOfYear:monthCal];
		}
		else if(argc == 2)
		{
			NSInteger year = [[NSString stringWithUTF8String:argv[1]] integerValue];
			if(year > 9999 || year < 1)
			{
				printf("cal: year %s not in range 1..9999",argv[1]);
			}
			[YearCalendar initYearCalendar:yearCal];
			YearCalendar *yearCalendar = [[YearCalendar alloc] initWithYear:year];
			[yearCalendar printYearCalendar:yearCal];
		}
		else if(argc == 3)
		{
			NSInteger month = [[NSString stringWithUTF8String:argv[1]] integerValue];
			NSInteger year = [[NSString stringWithUTF8String:argv[2]] integerValue];
			[MonthCalendar initMonthCalendar:monthCal];
			
			MonthCalendar *monthCalendar = [[MonthCalendar alloc] initWithMonth:month AndYear:year];
			
			if (month < 1 || month > 12)
			{
				printf("%s is not a month number(1..12)",argv[1]);
			}
			else if(year > 9999 || year < 1)
			{
				printf("cal: year %s not in range 1..9999",argv[2]);
			}
			else
			{
				[monthCalendar printMonthOfYear:monthCal];
			}
		}
	}
    return 0;
}