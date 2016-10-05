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


void NSStringPrint(NSString* str) {
    printf("%s", [str UTF8String]);
}

void NSStringPrintln(NSString* str) {
    printf("%s\n", [str UTF8String]);
}

void writeMonthTitle(NSString* monthTitle) {
    
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
        //NSInteger day = [calendar component:NSCalendarUnitDay fromDate:date];
        //NSInteger weekday = [calendar component:NSCalendarUnitWeekday fromDate:date];

        NSRange daysInMonth = [calendar rangeOfUnit: NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
        
        
        NSString* monthTitle = [NSString stringWithFormat: @"%@ %ld", monthsEN[month-1], (long)year];
        NSString* weekdaysTitle = [weekdaysEN componentsJoinedByString:@" "];
        
        NSInteger calRows = 8;
        NSInteger calCols = 21;
        NSMutableString *monthCal = [NSMutableString stringWithString:
                                     [[NSString string] stringByPaddingToLength: calRows*calCols
                                                                     withString: @" " startingAtIndex:0]];
        
        NSInteger monthTitleStartIndex = (calCols - monthTitle.length) / 2;
        [monthCal replaceCharactersInRange:NSMakeRange(monthTitleStartIndex, monthTitle.length) withString:monthTitle];
        [monthCal replaceCharactersInRange:NSMakeRange(calCols+1, weekdaysTitle.length) withString:weekdaysTitle];
  
        
        for(NSInteger dayInMonth=1; dayInMonth <= daysInMonth.length; dayInMonth++) {
            NSDateComponents *comps = [[NSDateComponents alloc] init];
            comps.year = year;
            comps.month = month;
            comps.day = dayInMonth;
            NSDate *iDate = [calendar dateFromComponents: comps];
            
            NSInteger weekInMonth = [calendar component:NSCalendarUnitWeekOfMonth fromDate:iDate];
            NSInteger dayInWeek = [calendar component:NSCalendarUnitWeekday fromDate:iDate];
            
            NSString *dayString = [NSString stringWithFormat:@"%3ld", (long)dayInMonth];
            
            //NSLog(@"%@", dayString);
            
            [monthCal replaceCharactersInRange:NSMakeRange(calCols*(2+weekInMonth-1)+(dayInWeek-1)*3, 3) withString:dayString];
            
        }
        
        //NSStringPrintln(monthCal);
        
        for(NSInteger row=0; row < calRows; row++) {
            NSStringPrintln([monthCal substringWithRange: NSMakeRange(calCols*row, calCols)]);
        }
        

    }
    return 0;
}
