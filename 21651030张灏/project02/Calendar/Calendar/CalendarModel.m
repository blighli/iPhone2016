//
//  CalendarModel.m
//  Calendar
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "CalendarModel.h"

@interface CalendarModel ()

@end

@implementation CalendarModel
{
	NSArray *monthModel;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self setYear:[self currentYear] andMonth:[self currentMonth]];
	}
	return self;
}

- (void)setYear:(NSInteger)year andMonth:(NSInteger)month
{
	self.month = month;
	self.year = year;
	[self calculateMonthModel];
}
//获取月份模型，以6 ＊ 7数组存储
- (void)calculateMonthModel
{
	NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *components = [[NSDateComponents alloc] init];
	[components setDay:1];
	[components setMonth:self.month];
	[components setYear:self.year];
	NSDate *date = [calendar dateFromComponents:components];
	components = [calendar components:NSCalendarUnitWeekday fromDate:date];
	NSInteger weekday = components.weekday;
	NSInteger daysNumber = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
	NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:42];
	for (NSInteger i = 0; i < weekday - 1; i++)
	{
		[mutableArray addObject:@0];
	}
	for (NSInteger i = 1; i < daysNumber + 1; i++)
	{
		[mutableArray addObject:[NSNumber numberWithInteger:i]];
	}
	for (NSInteger i = 0; i < 42 - daysNumber - weekday + 1; i++)
	{
		[mutableArray addObject:@0];
	}
	monthModel = [NSArray arrayWithArray:mutableArray];
}

-(NSArray *)getMonthModel
{
	return monthModel;
}

- (NSInteger)currentYear
{
	NSDate *date =[NSDate date];
	NSDateComponents *components = [[NSDateComponents alloc] init];
	NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
	components = [calendar components:NSCalendarUnitYear fromDate:date];
	//NSLog(@"components.year: %ld", components.year);
	return components.year;
}

- (NSInteger)currentMonth
{
	NSDate *date =[NSDate date];
	NSDateComponents *components = [[NSDateComponents alloc] init];
	NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
	components = [calendar components:NSCalendarUnitMonth fromDate:date];
	//NSLog(@"components.month: %ld", components.month);
	return components.month;
}


@end
