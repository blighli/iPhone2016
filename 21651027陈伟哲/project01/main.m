//
//  main.m
//  Cal
//
//  Created by cwz on 16/10/4.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Days.h"
#import "GetYearMonthNow.h"
#import "Print.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int year,month;
        Print *printMonthObj = [[Print alloc] init];
        Print *printYearObj = [[Print alloc] init];
        
        if(argc == 1){
            GetYearMonthNow *getYearMonth = [[GetYearMonthNow alloc] init];
            [getYearMonth yearMonth];
            year = getYearMonth.year;
            month = getYearMonth.month;
            [printMonthObj printmonth:year month:month];
        }
        
        else if(argc == 2){
            NSString *argv2 = [NSString stringWithUTF8String:argv[1]];
            [printYearObj printyear:[argv2 intValue]];
        }
        
        else if(argc == 3){
            NSString *argv2 = [NSString stringWithUTF8String:argv[1]];
            NSString *argv3 = [NSString stringWithUTF8String:argv[2]];
            GetYearMonthNow *getYearMonthNow = [[GetYearMonthNow alloc] init];
            BOOL isMonthRegex = [getYearMonthNow judgeNumberRegex:argv2];
            BOOL isYearRegex = [getYearMonthNow judgeNumberRegex:argv3];
            if(isMonthRegex && isYearRegex){
                if([argv2 intValue] > 12 || [argv2 intValue] <= 0){
                    NSLog(@"cal: %@ is neither a month number (1..12) nor a name\n",argv2);
                }else{
                    [printMonthObj printmonth:[argv3 intValue] month:[argv2 intValue]];
                }
                
            }
            
            else if(!isYearRegex){
                //[getYearMonthNow yearMonth];
                //year = getYearMonthNow.year;
                //[printMonthObj printmonth:year month:[argv3 intValue]];
                NSLog(@"cal: year %@ not in range 1..9999\n",argv3);
            }
            
            else if(!isMonthRegex){
                NSLog(@"cal: %@ is neither a month number (1..12) nor a name\n",argv2);
            }
            
            else if(isMonthRegex){
                if([argv2 intValue] > 12 || [argv2 intValue] <= 0){
                    NSLog(@"cal: %@ is neither a month number (1..12) nor a name\n",argv2);
                }
            }
        }
    }
    return 0;
}
