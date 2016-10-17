//
//  MonthCalendar.m
//  cal
//
//  Created by 戈宇泽 on 16/10/8.
//  Copyright © 2016年 戈宇泽. All rights reserved.
//

#import "MonthCalendar.h"

@implementation MonthCalendar
-(void)printMonthOfYear:(NSInteger[6][7])monthCal
{
	int startPos = [self returnStartPosition];
	for(int i = 0; i<startPos;i++)
	{
		printf(" ");
	}
	printf("%s %ld\n",[[MonthCalendar convert:self._month] cStringUsingEncoding:NSUTF8StringEncoding], (long)self._year);
	printf("日 一 二 三 四 五 六\n");
	
	[self setMonthCal:monthCal];
	for(int i = 0; i < 6; i++)
	{
		for(int j = 0; j < 7; j++)
		{
			if(monthCal[i][j] == 0)
			{
				printf("   ");
			}
			else
			{
				printf("%2ld",monthCal[i][j]);
				if(j != 6)
				{
					printf(" ");
				}
			}
		}
		printf("\n");
	}
}

-(void)setMonthCal:(NSInteger[6][7])monthCal
{
    NSInteger j = self._weekday - 1;//得到某年某月1号在月历中的列号
	NSInteger days = 1;
	for(NSInteger i = 0; i < 6; i++)
	{
		for(; j<7;j++)
		{
			if(days <= self._days)
			{
				monthCal[i][j] = days;
				days++;
			}
		}
		j = 0;
	}
}

+(void)initMonthCalendar:(NSInteger [6][7])monthCal
{
	for(int i=0; i<6; i++)
	{
		for(int j=0;j<7;j++)
		{
			monthCal[i][j] = 0;
		}
	}
}

+(NSString*)convert:(NSInteger) month
{
	NSString *m = [[NSString alloc] init];
	switch (month) {
		case 1:{
			m = @"一月";
			break;}
			
		case 2:{
			m = @"二月";
			break;}
			
		case 3:{
			m = @"三月";
			break;
		}
			
		case 4:{
			m = @"四月";
			break;
		}
			
		case 5:{
			m = @"五月";
			break;
		}
			
		case 6:{
			m = @"六月";
			break;
		}
			
		case 7:{
			m = @"七月";
			break;
		}
			
		case 8:{
			m = @"八月";
			break;
		}
			
		case 9:{
			m = @"九月";
			break;
		}
			
		case 10:{
			m = @"十月";
			break;
		}
			
		case 11:{
			m = @"十一月";
			break;
		}
			
		case 12:{
			m = @"十二月";
			break;
		}
			
		default:
			break;
	}
	return m;
}

-(instancetype)initWithMonth:(NSInteger)month AndYear:(NSInteger)year
{
	if(self = [super init])
	{
		self._month = month;
		self._year  = year;
		
		NSCalendar *GeoCalendar = [[NSCalendar alloc]
								   initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
		
		NSDateComponents *component = [[NSDateComponents alloc] init];
		[component setDay:1];
		[component setMonth:month];
		[component setYear:year];
		//生成某年某月1号的日期
		self._date = [GeoCalendar dateFromComponents:component];
		self._days = (NSInteger)[GeoCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self._date].length;
		self._weekday =[GeoCalendar component:NSCalendarUnitWeekday fromDate:self._date];//计算由date代表的一天是星期几
	}
	return self;
}

//返回年份的打印位置
-(int)returnStartPosition
{
	int pos;
	int yearNumber = [self getYearNumber:self._year];
	
	if(self._month > 10)
	{
		pos = (20 - 1 - 3*2 - yearNumber) / 2;
	}
	else
	{
		pos = (20 -1 -2*2 - yearNumber) /2;
	}
	return pos;
}

//获取年份是几位数
-(int)getYearNumber:(NSInteger)year
{
	int yearNumber = 0;
	while(year > 0)
	{
		year = year / 10;
		yearNumber++;
	}
	return yearNumber;
}
@end