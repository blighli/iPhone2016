//
//  calendarView.m
//  Calendar
//
//  Created by 郁飞范 on 16/10/16.
//  Copyright © 2016年 yufeifan. All rights reserved.
//

#import "calendarView.h"
#define RowDistance 5

@interface calendarView()
@property (nonatomic, strong) NSCalendar *cal;
@property (nonatomic) NSInteger days;
@end

@implementation calendarView
{
	CGPoint calStart;
	NSInteger monthCal[6][7];
}

- (instancetype)initWithFrame:(CGRect)frame
{
	if(self = [super initWithFrame:frame])
	{
		self.cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
		for(int i=0; i<6; i++)
		{
			for(int j=0;j<7;j++)
			{
				monthCal[i][j] = 0;
			}
		}
	}
	return self;
}

- (void)drawRect:(CGRect)rect
{
	[self drawTitle];
	[self setMonthCal];
	UIFont *font = [UIFont systemFontOfSize:15 weight:14];
	NSDictionary* attributes = @{NSFontAttributeName : font};
	NSString *strToBeDraw = [[NSString alloc] init];
	CGSize spaceSize = [@"    " sizeWithAttributes:attributes];
	CGFloat fixedX = calStart.x;
	for(int i = 0; i < 6; i++)
	{
		for(int j = 0; j < 7; j++)
		{
			if(monthCal[i][j] != 0)
			{
				strToBeDraw = [self getDayString:monthCal[i][j]];
			}
			else
			{
				strToBeDraw = @"  ";
			}
			[strToBeDraw drawAtPoint:calStart withAttributes:attributes];
			calStart.x += spaceSize.width*2;
		}
		calStart.x = fixedX;
		calStart.y += spaceSize.height;
	}
	
}

- (void)setMonthCal
{
	NSInteger j = [self getFirstDate] - 1;
	NSInteger days = 1;
	for(NSInteger i=0;i<6;i++)
	{
		for(; j<7;j++)
		{
			if(days <=self.days)
			{
				monthCal[i][j] = days;
				days++;
			}
		}
		j = 0;
	}
}

- (NSString*)getDayString:(NSInteger)day
{
	if(day<10)
	{
		NSMutableString *str = [NSMutableString stringWithFormat:@" %ld",day];
		return [NSString stringWithString:str];
	}
	else
	{
		return [NSString stringWithFormat:@"%ld",day];
	}
}

- (void)drawTitle
{
	UIFont *font = [UIFont systemFontOfSize:18 weight:20];
	NSDictionary* attributes = @{NSFontAttributeName : font};
	CGSize textSize = [@"2016" sizeWithAttributes:attributes];
	
	UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.25 * self.frame.size.height, self.frame.size.width, textSize.height)];
	title.backgroundColor = [UIColor clearColor];
	title.textColor = [UIColor blackColor];
	title.textAlignment = NSTextAlignmentCenter;
	title.text = [self getTitle];
	[self addSubview:title];
	
	CGSize calSize = [@"00  00  00  00  00  00  00" sizeWithAttributes:attributes];
	CGPoint startPoint = {(self.frame.size.width - calSize.width) / 2, title.frame.origin.y+title.frame.size.height + RowDistance};
	UILabel *weekTitle = [[UILabel alloc] initWithFrame:CGRectMake(startPoint.x, startPoint.y, calSize.width, calSize.height)];
	weekTitle.backgroundColor = [UIColor clearColor];
	weekTitle.textColor = [UIColor blackColor];
	weekTitle.textAlignment = NSTextAlignmentCenter;
	weekTitle.text = @"日  一  二  三  四  五  六";
	[self addSubview:weekTitle];
	
	CGFloat y = weekTitle.frame.origin.y;
	CGFloat h = weekTitle.frame.size.height;
	calStart.x = weekTitle.frame.origin.x+RowDistance*4;
	calStart.y = y+h+RowDistance;
}

- (NSInteger)getFirstDate
{
	NSDate *today = [NSDate date];
	NSInteger month = [self.cal component:NSCalendarUnitMonth fromDate:today];
	NSInteger year  = [self.cal component:NSCalendarUnitYear fromDate:today];
	NSDateComponents *component = [[NSDateComponents alloc] init];
	[component setDay:1];
	[component setMonth:month];
	[component setYear:year];
	NSDate *firstDay = [self.cal dateFromComponents:component];
	self.days = [self.cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDay].length;
	NSInteger weekday = [self.cal component:NSCalendarUnitWeekday fromDate:firstDay];
	return weekday;
}

- (NSString *)getTitle
{
	NSMutableString *title = [[NSMutableString alloc] init];
	NSDate *today = [NSDate date];
	NSInteger month = [self.cal component:NSCalendarUnitMonth fromDate:today];
	NSInteger year  = [self.cal component:NSCalendarUnitYear fromDate:today];
	title = [NSMutableString stringWithString:[self convert:month]];
	[title appendString:@"  "];
	[title appendString:[NSMutableString stringWithFormat:@"%ld",(long)year]];
	return title;
}

-(NSString*)convert:(NSInteger) month
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
@end
