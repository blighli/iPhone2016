//
//  MYMonthCalendarView.m
//  myCal
//
//  Created by liqilei on 2016/10/5.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import "MYCalendarMonthView.h"
#import "Utils.h"

@interface MYCalendarMonthView()
{
    NSMutableString* _viewBuffer;
}

+ (NSArray*) weekdayNames;
- (void)writeTitleOfMonth:(NSInteger) month andYear:(NSInteger)year;
- (void)writeTitleOfWeekdays;
- (void)writeDaysOfMonth: (NSInteger) month andYear: (NSInteger) year;


@end

@implementation MYCalendarMonthView

+ (NSArray*) monthNames;
{
    static NSArray* names;
    if (names == nil) {
        names = @[@"January",
                  @"February",
                  @"March",
                  @"April",
                  @"May",
                  @"June",
                  @"July",
                  @"August",
                  @"September",
                  @"October",
                  @"November",
                  @"December"];
    }
    return names;
}

+ (NSArray*) weekdayNames
{
    static NSArray* names;
    if (names == nil) {
        names = @[@"Su", @"Mo", @"Tu", @"We", @"Th", @"Fr", @"Sa"];
    }
    return names;
    
}

- (instancetype) initWithMonth: (NSInteger) month andYear: (NSInteger) year;
{
    self = [super init];
    if (self) {
        NSString* stringBuffer = [[NSString string] stringByPaddingToLength: MYCalendarMonthViewSize
                                                                 withString:@" "
                                                            startingAtIndex:0];
        _viewBuffer = [NSMutableString stringWithString: stringBuffer];
        [self setMonth: month andYear: year];
    }
    return self;
}

- (void) writeTitleOfMonth: (NSInteger) month andYear: (NSInteger) year
{
    NSString* monthTitle = [NSString stringWithFormat: @"%@ %ld", [[self class]monthNames][month-1], (long)year];
    NSInteger monthTitleStartIndex = (MYCalendarMonthViewColumns - monthTitle.length) / 2;
    [_viewBuffer replaceCharactersInRange:NSMakeRange(monthTitleStartIndex, monthTitle.length)
                               withString:monthTitle];
}

- (void)writeTitleOfWeekdays
{
    NSString* weekdayTitle = [[[self class] weekdayNames] componentsJoinedByString:@" "];
    [_viewBuffer replaceCharactersInRange:NSMakeRange(MYCalendarMonthViewColumns, weekdayTitle.length)
                               withString:weekdayTitle];
}



- (void)writeDaysOfMonth: (NSInteger) month andYear: (NSInteger) year
{
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = year;
    dateComponents.month = month;
    NSDate* date = [calendar dateFromComponents:dateComponents];
    NSRange monthDays = [calendar rangeOfUnit: NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    
    for(NSInteger monthDay = 1; monthDay <= monthDays.length; monthDay++) {
        dateComponents.day = monthDay;
        date = [calendar dateFromComponents: dateComponents];
        
        NSInteger weekOfMonth = [calendar component:NSCalendarUnitWeekOfMonth fromDate:date];
        NSInteger weekday = [calendar component:NSCalendarUnitWeekday fromDate:date];
        
        NSString *monthDayString = [NSString stringWithFormat:@"%2ld ", (long)monthDay];
        NSInteger monthDayIndex = MYCalendarMonthViewColumns * (weekOfMonth+1) + (weekday-1) * MYCalendarMonthViewDayWidth;
        [_viewBuffer replaceCharactersInRange:NSMakeRange(monthDayIndex, MYCalendarMonthViewDayWidth)
                                   withString:monthDayString];
    }
}

- (void) setMonth: (NSInteger) month andYear: (NSInteger) year
{
    [self writeTitleOfMonth:month andYear:year];
    [self writeTitleOfWeekdays];
    [self writeDaysOfMonth:month andYear:year];
}

- (void) printView
{
    for(NSInteger row = 0; row < MYCalendarMonthViewRows; row++) {
        println([_viewBuffer substringWithRange: NSMakeRange(MYCalendarMonthViewColumns * row, MYCalendarMonthViewColumns)]);
    }
}

@end
