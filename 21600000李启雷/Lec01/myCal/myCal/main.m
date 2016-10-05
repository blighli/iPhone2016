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
 
*/

#import <Foundation/Foundation.h>


void NSStringPrint(NSString* str) {
    printf("%s", [str UTF8String]);
}

void NSStringPrintln(NSString* str) {
    printf("%s\n", [str UTF8String]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
        NSDate* date = [NSDate date];
        
        NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        NSArray* monthsEN = @[@"January", @"February", @"March", @"April",
                             @"May", @"June", @"July", @"August",
                             @"September", @"October", @"November", @"December"];
        
        NSArray* weekdaysEN = @[@"Su", @"Mo", @"Tu", @"We", @"Th", @"Fr", @"Sa"];
        
        NSInteger year = [calendar component:NSCalendarUnitYear fromDate:date];
        NSInteger month = [calendar component:NSCalendarUnitMonth fromDate:date];
        NSInteger day = [calendar component:NSCalendarUnitDay fromDate:date];
        NSInteger weekday = [calendar component:NSCalendarUnitWeekday fromDate:date];

        NSRange daysInMonth = [calendar rangeOfUnit: NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
        
        
        NSString* monthTitle = [NSString stringWithFormat: @"%@ %ld", monthsEN[month-1], (long)year];
        NSString* weekdaysTitle = [weekdaysEN componentsJoinedByString:@" "];
        NSStringPrintln(monthTitle);
        NSStringPrintln(weekdaysTitle);
        
        
        for(NSInteger dayInMonth=1; dayInMonth <= daysInMonth.length; dayInMonth++) {
            
        }
        

    }
    return 0;
}
