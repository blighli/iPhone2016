//
//  YearCalendar.m
//  cal
//
//  Created by 戈宇泽 on 16/10/8.
//  Copyright © 2016年 戈宇泽. All rights reserved.
//

#import "YearCalendar.h"

@implementation YearCalendar

-(void)printYearCalendar:(NSInteger[24][21])yearCal
{
	[self setMonthArray:yearCal];
	for(int i = 0; i < 24; i++)
	{
		if(i == 0)
		{
			printf("        一月                  二月                  三月\n");
			printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六\n");
		}
		else if(i == 6)
		{
			printf("        四月                  五月                  六月\n");
			printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六\n");
		}
		else if (i == 12)
		{
			printf("        七月                  八月                  九月\n");
			printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六\n");
		}
		else if(i == 18)
		{
			printf("        十月                 十一月                十二月\n");
			printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六\n");
		}
		for(int j = 0; j < 21; j++)
		{
			if(yearCal[i][j] == 0)
			{
				printf("  ");
			}
			else
			{
				printf("%2ld",yearCal[i][j]);
			}
			
			if(j%7 == 6)
			{
				printf("  ");
			}
			else
			{
				printf(" ");
			}
		}
		printf("\n");
	}
}

-(void)setMonthArray:(NSInteger[24][21])yearCal
{
	NSInteger monthCal[6][7];
	for(int i =0 ; i < 12; i++)
	{
		[MonthCalendar initMonthCalendar:monthCal];
		MonthCalendar *temp = (MonthCalendar*)self._monthArray[i];
		[temp setMonthCal:monthCal];//对临时月历填充当月月历
		
		NSInteger j = temp._weekday - 1;
		for(;j < temp._days+temp._weekday-1;j++)
		{
			//将月历[j/7][j%7]的位置的日期填到年历数组行为row，列为col的位置
			NSInteger row = i/3*6+j/7;
			NSInteger col = i%3*7+j%7;
			yearCal[row][col] = monthCal[j/7][j%7];
		}
	}
	
}

-(instancetype)initWithYear:(NSInteger)year
{
	if(self = [super init])
	{
		self._year = year;
		self._monthArray = [[NSMutableArray alloc] init];
		for(NSInteger i=0; i <12; i++)
		{
			MonthCalendar *monthCal = [[MonthCalendar alloc] initWithMonth:(i+1) AndYear:self._year];
			[self._monthArray addObject:monthCal];
		}
	}
	return self;
}

+(void)initYearCalendar:(NSInteger[24][21])yearCal
{
	for(int i=0; i<24; i++)
	{
		for(int j=0;j<21;j++)
		{
			yearCal[i][j] = 0;
		}
	}
}
@end
