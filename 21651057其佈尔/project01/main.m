//
//  main.m
//  test
//
//  Created by sally on 16/10/5.
//  Copyright © 2016年 sally. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "print.h"
#import "days.h"

@interface JudgeNumberRegex : NSObject

- (BOOL)isNumber : (NSString *)str;

@end

@implementation JudgeNumberRegex

- (BOOL)isNumber : (NSString *)str {
    NSString * numRegex = @"^[0-9]+$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRegex];
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (isMatch) {
        return true;
    } else {
        return false;
    }
    return false;
}

@end

int main(int argc, const char * argv[]) {
    
    @autoreleasepool{
        Print * printMonthObj = [[Print alloc] init];
        Print * printYearObj = [[Print alloc] init];

        if (argc == 1) {//have no parameter
            NSDate * date = [NSDate date];
            NSCalendar * cal = [NSCalendar currentCalendar];
            
            unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
            NSDateComponents * d = [cal components:unitFlags fromDate:date];
            
            int yearNow = (int)[d year];
            int monthNow = (int)[d month];
            [printMonthObj printMonth:yearNow month:monthNow];
        } else if (argc == 2) {//have one parameters(year)
            
            NSString * argv2 = [NSString stringWithUTF8String:argv[1]];
            
            JudgeNumberRegex * judge = [[JudgeNumberRegex alloc] init];
            BOOL isYear = [judge isNumber:argv2];
            
            if (isYear) {
                if ([argv2 intValue] < 1970) {
                    printf("Parameter year can't be smaller than 1970.\n");
                    return 0;
                } else {
                    [printYearObj printYear:[argv2 intValue]];
                }
            }
            
        } else if (argc == 3) {//have two parameters(month year)
            NSString * argv2 = [NSString stringWithUTF8String:argv[1]];
            NSString * argv3 = [NSString stringWithUTF8String:argv[2]];
            
            JudgeNumberRegex * judge = [[JudgeNumberRegex alloc] init];
            BOOL isMonth = [judge isNumber:argv2];
            BOOL isYear = [judge isNumber:argv3];
            
            if (isMonth && isYear) {
                if ([argv2 intValue] > 12) {
                    printf("This is something wrong with parameter month.\n");
                    return 0;
                } else if ([argv3 intValue] < 1970) {
                    printf("Parameter year can't be smaller than 1970.\n");
                    return 0;
                } else {
                    [printMonthObj printMonth:[argv3 intValue] month:[argv2 intValue]];
                }
            } else {
                printf("This is something wrong with parameter month or year.\n");
            }
        }
    }
    
    return 0;
}
