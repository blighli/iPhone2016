//
//  MYMonthView.m
//  MyCal
//
//  Created by Nick Alan on 10/23/16.
//  Copyright © 2016 Nick Alan. All rights reserved.
//

#import "MYMonthView.h"
#import "MyViewBuffer.h"

@interface MYMonthView()

+(NSArray*)weekdayNames;
-(void)writeTitleOfMonth;
-(void)writeTitleOfWeekdays;
-(void)writeDays;

@end

@implementation MYMonthView

+(NSArray*)monthNames;
{
    static NSArray* _monthNames;
    if(_monthNames == nil)
    {
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

+(NSArray*)weekdayNames
{
    static NSArray* _weekdayNames;
    if(_weekdayNames == nil){
        _weekdayNames = @[@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa"];
    }
    return _weekdayNames;
}

-(instancetype)initWithMonth:(NSInteger)month andYear:(NSInteger)year andStandAlone:(Boolean)standAlone
{
    self = [super init];
    if(self)
    {
        _month = month;
        _year = year;
        _standAlone = standAlone;
        _viewBuffer = [[MyViewBuffer alloc] initWithWidth:MYMonthViewWidth andHeight:MYMonthViewHeight];
        
        [self writeTitleOfMonth];
        [self writeTitleOfWeekdays];
        [self writeDays];
    }
    return self;
}

-(void)writeTitleOfMonth
{
    NSString *monthName = [[self class] monthNames] [_month-1];
    NSString *title = monthName;
    if(_standAlone)
    {
        title = [NSString stringWithFormat:@"%@ %ld",monthName,(long)_year];
    }
    NSInteger x = (_viewBuffer.width-title.length) / 2;
    [_viewBuffer writeString:title toX:x andY:0];
}

-(void)writeTitleOfWeekdays
{
    NSString *title = [[[self class] weekdayNames] componentsJoinedByString:@" "];
    [_viewBuffer writeString:title toX:0 andY:1];
}

-(void)writeDays
{
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = _year;
    dateComponents.month = _month;
    NSDate *date = [calender dateFromComponents:dateComponents];
    NSRange days = [calender rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    
    for(NSInteger day = 1;day <= days.length;day++)
    {
        dateComponents.day = day;
        date = [calender dateFromComponents:dateComponents];
        
        NSInteger weekOfMonth = [calender component:NSCalendarUnitWeekOfMonth fromDate:date];
        NSInteger weekday = [calender component:NSCalendarUnitWeekday fromDate:date];
        
        NSString *dayString = [NSString stringWithFormat:@"%2ld",(long)day];
        NSInteger x = (weekday-1) * 3;
        NSInteger y = weekOfMonth + 1;
        [_viewBuffer writeString:dayString toX:x andY:y];
    }
}
    
@end
