//
//  main.m
//  myCal
//
//  Created by liqilei on 2016/10/5.
//  Copyright © 2016年 liqilei. All rights reserved.
//

/*
 
 cal - print the calendar
 
 
 1. No arguments: cal
 print the current month
 
 2. One arguments: cal 2016
 print the calendar of the specific year
 
 3. Two arguments: cal 10 2016
 print the calendar of the specific month in that year
 
 note:
 In calendar month is from 1 to 12, and month day is from 1 to 31, and week day is from 1(sunday) to 7(saturday)
 
 */

#import <Foundation/Foundation.h>
#import "MYMonthView.h"
#import "MYYearView.h"
#import "MYViewBuffer.h"

void printString(NSString* str)
{
    printf("%s\n",str.UTF8String);
}

NSInteger yearFromString(const char* str)
{
    NSString *strYear = [NSString stringWithUTF8String: str];
    NSInteger year = [strYear integerValue];
    if(year < 1 || year > 9999) {
        printString([NSString stringWithFormat: @"cal: year %@ not in range 1..9999",strYear]);
        return 0;
    }
    return year;
}

NSInteger monthFromString(const char* str) {
    NSString *strMonth = [NSString stringWithUTF8String: str];
    NSInteger month = 0;
    if(strMonth.length<3) {
        month = strMonth.integerValue;
        if(month < 1 || month > 12) {
            month = 0;
        }
    }
    else{
        for(NSInteger index=1; index <= [MYMonthView monthNames].count; index++){
            NSString* monthName = [MYMonthView monthNames][index - 1];
            if([[monthName lowercaseString] hasPrefix: [strMonth lowercaseString]]) {
                month = index;
                break;
            }
        }
    }
    if(month == 0) {
        printString([NSString stringWithFormat: @"cal: %@ is neither a month number (1..12) nor a name", strMonth]);
    }
    return month;
}

void printMonth(NSInteger month, NSInteger year) {
    MYMonthView* view = [[MYMonthView alloc] initWithMonth:month andYear:year andStandAlone:YES];
    [view.viewBuffer display: ^(NSString* str,int row){
        printString(str);
    }];
}

void printYear(NSInteger year) {
    MYYearView* view = [[MYYearView alloc] initWithYear:year];
    [view.viewBuffer display: ^(NSString* str,int row){
        printString(str);
    }];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        NSInteger year = 0;
        NSInteger month = 0;
        
        if(argc == 1) {
            NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDate* date = [NSDate date];
            year = [calendar component:NSCalendarUnitYear fromDate:date];
            month = [calendar component:NSCalendarUnitMonth fromDate:date];
            printMonth(month, year);
        }
        else if(argc == 2) {
            year = yearFromString(argv[1]);
            if(year !=0){
                printYear(year);
            }
        }
        else if(argc == 3) {
            month = monthFromString(argv[1]);
            year = yearFromString(argv[2]);
            if(year !=0 && month != 0){
                printMonth(month, year);
            }
        }
        else {
            printString(@"cal: too many args!");
        }
    }
    return 0;
}
