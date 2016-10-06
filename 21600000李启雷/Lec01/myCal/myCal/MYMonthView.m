//
//  MYMonthView.m
//  myCal
//
//  Created by liqilei on 2016/10/6.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import "MYMonthView.h"
#import "MYViewBuffer.h"

@interface MYMonthView()

+ (NSArray*) weekdayNames;
- (void)writeTitleOfMonth;
- (void)writeTitleOfWeekdays;
- (void)writeDays;

@end

@implementation MYMonthView

+ (NSArray*) monthNames;
{
    static NSArray* _monthNames;
    if (_monthNames == nil) {
        _monthNames = @[@"January",
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
    return _monthNames;
}

+ (NSArray*) weekdayNames
{
    static NSArray* _weekdayNames;
    if (_weekdayNames == nil) {
        _weekdayNames = @[@"Su", @"Mo", @"Tu", @"We", @"Th", @"Fr", @"Sa"];
    }
    return _weekdayNames;
}

- (instancetype)initWithMonth:(NSInteger)month andYear:(NSInteger)year
{
    self = [super init];
    if (self) {
        _month = month;
        _year = year;
        _standAlone = YES;
        _viewBuffer = [[MYViewBuffer alloc] initWithWidth:MYMonthViewWidth andHeight:MYMonthViewHeight];
        
        [self writeTitleOfMonth];
        [self writeTitleOfWeekdays];
        [self writeDays];
        
    }
    return self;
}


- (void)writeTitleOfMonth
{
    NSString* monthName = [[self class] monthNames][_month-1];
    NSString* title = monthName;
    if(_standAlone){
        title = [NSString stringWithFormat:@"%@ %ld", monthName, (long)_year];
    }
    NSInteger x = (_viewBuffer.width - title.length) / 2;
    [_viewBuffer writeString:title toX:x andY:0];
}

- (void)writeTitleOfWeekdays
{
    NSString* title = [[[self class] weekdayNames] componentsJoinedByString:@" "];
    [_viewBuffer writeString:title toX:0 andY:1];
}

- (void)writeDays
{
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = _year;
    dateComponents.month = _month;
    NSDate* date = [calendar dateFromComponents:dateComponents];
    NSRange days = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    
    for(NSInteger day = 1; day <= days.length; day++) {
        dateComponents.day = day;
        date = [calendar dateFromComponents: dateComponents];
        
        NSInteger weekOfMonth = [calendar component:NSCalendarUnitWeekOfMonth fromDate:date];
        NSInteger weekday = [calendar component:NSCalendarUnitWeekday fromDate:date];
        
        NSString* dayString = [NSString stringWithFormat:@"%2ld", (long)day];
        NSInteger x = (weekday-1) * 3;
        NSInteger y = weekOfMonth+1;
        [_viewBuffer writeString:dayString toX:x andY:y];
    }
}

@end
