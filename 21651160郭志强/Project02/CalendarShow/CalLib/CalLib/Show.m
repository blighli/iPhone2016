//
//  Show.m
//  CalLib
//
//  Created by Armas on 10/19/16.
//  Copyright © 2016 Armas. All rights reserved.
//

#import "Show.h"

@implementation Show

-(NSString*)selectMonth:(NSInteger)_month year:(NSInteger)_year{
 
        return printMonth(_month, _year);
}

-(NSString*)selectYear:(NSInteger)year{
    return printYear(year);
}

NSString* printMonth(NSInteger month, NSInteger year) {
    MYMonthView* view = [[MYMonthView alloc] initWithMonth:month andYear:year andStandAlone:YES];
    return [view.viewBuffer display];
    
}

NSString* printYear(NSInteger year) {
    NSString* result = yearFromText(year);
    if([result isEqualToString:@""]){
        MYYearView* view = [[MYYearView alloc] initWithYear:year];
        return [view.viewBuffer display];
    }else
        return @"";
}

//判断year是否在1...9999内
NSString* yearFromText(NSInteger year){
    NSString* error = @"";
    if(year < 1 || year > 9999) {
        error = [NSString stringWithFormat: @"cal: year %ld not in range 1..9999",(long)year];
    }
    
    return error;
}

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
    


@end
