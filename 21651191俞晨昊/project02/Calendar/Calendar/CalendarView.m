//
//  CalendarView.m
//  Created by ych.
//  Copyright © 2016年 mutouren. All rights reserved.


#import "CalendarView.h"

@interface CalendarView ()

@property (nonatomic)NSArray *monthStringArray;
@property (nonatomic)NSArray *monthModel;
//@property (nonatomic)NSString *stringToDraw;

@end

@implementation CalendarView

- (instancetype)init
{
	return [self initWithCalendarModel:[[CalendarModel alloc] init]];
}

- (instancetype)initWithCalendarModel: (CalendarModel *)calendarModel
{
	self = [super init];
	if (self != nil)
	{
		self.calendarModel = calendarModel;
	}
	
	return self;
}

- (void)drawRect:(CGRect)rect
{
	//[super drawRect:rect];
//	CGSize size = [_stringToDraw sizeWithAttributes:nil];
//	CGRect newRect = rect;
//	newRect.size = size;
	[super drawRect:rect];
	NSString *string = [self transformCalendarModelIntoString];
	
	[string drawAtPoint:CGPointMake(0, 0) withAttributes:nil];
}

- (NSString *)transformCalendarModelIntoString
{
	//NSLog(@"[self.calendarModel.month - 1]: %ld", self.calendarModel.month - 1);
	NSMutableString *string = [[NSMutableString alloc] init];
	//NSMutableString *string = [NSMutableString stringWithFormat:@"    %@  %ld\n", self.monthStringArray[self.calendarModel.month - 1], (long)self.calendarModel.year];
	[string appendString:@"Sun  Mon  Tue  Wed  Thu  Fri  Sat\n\n"];
	//[string appendString:@"日  一  二  三  四  五  六\n"];
	for (int i = 0; i < 42; i++)
	{
		NSInteger value = [((NSNumber *)self.monthModel[i]) integerValue];
		if (value == 0) [string appendString:@"        "];
		else if (value < 10) [string appendFormat:@"    %ld  ", value];
		else [string appendFormat:@"  %ld  ", value];
		//NSLog(@"\n%2d ", 6);
		if (i % 7 == 6) [string appendString:@"\n\n"];
	}
	//NSLog(@"%@", string);
	return [NSString stringWithString:string];
	
}

- (CGSize)minBoundingSize
{
	NSString *string = [self transformCalendarModelIntoString];
	return [string sizeWithAttributes:nil];
}

#pragma mark - Accessor Methods

- (NSArray *)monthStringArray
{
	if (_monthStringArray == nil)
	{
		_monthStringArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"];
		//_monthStringArray = @[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"];
	}
	return _monthStringArray;
}

- (void)setCalendarModel:(CalendarModel *)calendarModel
{
	_calendarModel = calendarModel;
	self.monthModel = [calendarModel getMonthModel];
}



@end
