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
    NSInteger _month;
}

+ (NSArray*) weekdayNames;

- (void) setMonth: (NSInteger) month andYear: (NSInteger) year inWholeYear: (Boolean) wholeYear;
- (void) writeTitleOfMonth:(NSInteger) month andYear:(NSInteger)year inWholeYear: (Boolean)wholeYear;
- (void) writeTitleOfWeekdays;
- (void) writeDaysOfMonth: (NSInteger) month andYear: (NSInteger) year;


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

- (instancetype) initWithMonth: (NSInteger) month andYear: (NSInteger) year inWholeYear: (Boolean)wholeYear;
{
    self = [super init];
    if (self) {
        NSString* stringBuffer = [[NSString string] stringByPaddingToLength: MYCalendarMonthViewSize
                                                                 withString:@" "
                                                            startingAtIndex:0];
        _viewBuffer = [NSMutableString stringWithString: stringBuffer];
        
        _month = month;
        [self setMonth: month andYear: year inWholeYear: wholeYear];
    }
    return self;
}

- (void) writeTitleOfMonth: (NSInteger) month andYear: (NSInteger) year inWholeYear: (Boolean)wholeYear
{
    NSString* monthTitle = [NSString stringWithFormat: @"%@ %ld", [[self class]monthNames][month-1], (long)year];
    if(wholeYear){
        monthTitle = [NSString stringWithFormat: @"%@", [[self class]monthNames][month-1]];
    }
    NSInteger monthTitleStartIndex = (MYCalendarMonthViewColumns - monthTitle.length - 1) / 2;
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

- (void) setMonth: (NSInteger) month andYear: (NSInteger) year inWholeYear: (Boolean) wholeYear
{
    [self writeTitleOfMonth:month andYear:year inWholeYear:wholeYear];
    [self writeTitleOfWeekdays];
    [self writeDaysOfMonth:month andYear:year];
}

- (void) printView
{
    for(NSInteger row = 0; row < MYCalendarMonthViewRows; row++) {
        NSString* rowString = [_viewBuffer substringWithRange: NSMakeRange(MYCalendarMonthViewColumns * row, MYCalendarMonthViewColumns)];
        println(rowString);
    }
}

- (void) writeMonthToBuffer: (NSMutableString*) buffer withColumns: (NSInteger) width
{
    for(NSInteger row = 0; row < MYCalendarMonthViewRows; row++) {
        NSInteger rowsOfTitle = 2;
        NSInteger rowsAbove = rowsOfTitle + MYCalendarMonthViewRows * ( (_month - 1) / 3 ) + row;
        NSInteger colsBefore = (MYCalendarMonthViewColumns + 1) * ((_month -1) % 3);
        NSInteger startIndex = width * rowsAbove+ colsBefore;
        NSString* rowString = [_viewBuffer substringWithRange: NSMakeRange(MYCalendarMonthViewColumns * row, MYCalendarMonthViewColumns)];
        [buffer replaceCharactersInRange:NSMakeRange(startIndex, MYCalendarMonthViewColumns) withString: rowString];
    }
}

@end
