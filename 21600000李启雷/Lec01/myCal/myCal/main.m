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
        
        NSArray* monthsEN = @[@"January", @"February", @"March", @"April",
                              @"May", @"June", @"July", @"August",
                              @"September", @"October", @"November", @"December"];
        
        NSArray* weekdaysEN = @[@"Su", @"Mo", @"Tu", @"We", @"Th", @"Fr", @"Sa"];

        NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

        
        NSDate* date = [NSDate date];
        NSInteger year = 0;
        NSInteger month = 0;
        
        if(argc == 1) {
            year = [calendar component:NSCalendarUnitYear fromDate:date];
            month = [calendar component:NSCalendarUnitMonth fromDate:date];
        }
        else if(argc == 2) {
            NSString *strYear = [NSString stringWithUTF8String: argv[1]];
            year = [strYear integerValue];
            if(year < 1 || year > 9999) {
                NSStringPrintln([NSString stringWithFormat: @"cal: year %@ not in range 1..9999",strYear]);
                return 0;
            }
        }
        else if(argc == 3) {
            NSString *strMonth = [NSString stringWithUTF8String: argv[1]];
            if(strMonth.length<3) {
                month = strMonth.integerValue;
                if(month < 1 || month > 12) {
                    month = 0;
                }
            }
            else{
                for(NSInteger iMonth=1; iMonth<=12; iMonth++){
                    NSString *monthNameEn = monthsEN[iMonth-1];
                    if([[monthNameEn lowercaseString] hasPrefix: [strMonth lowercaseString]]) {
                        month = iMonth;
                        break;
                    }
                }
            }
            if(month == 0) {
                NSStringPrintln([NSString stringWithFormat: @"cal: %@ is neither a month number (1..12) nor a name",strMonth]);
                return 0;
            }
            
            NSString *strYear = [NSString stringWithUTF8String: argv[2]];
            year = [strYear integerValue];
            if(year < 1 || year > 9999) {
                NSStringPrintln([NSString stringWithFormat: @"cal: year %@ not in range 1..9999",strYear]);
                return 0;
            }
            
            NSDateComponents *comps = [[NSDateComponents alloc] init];
            comps.year = year;
            comps.month = month;
            date = [calendar dateFromComponents:comps];
            
        }
        else {
            NSLog(@"cal: too many args!");
        }
        
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
