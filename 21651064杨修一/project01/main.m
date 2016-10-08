//
//  main.m
//  calWithOc
//
//  Created by aleafall on 16-10-7.
//  Copyright (c) 2016年 aleafall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YearAndMonthNow.h"
#import "JudgeNumberRegex.h"
#import "PrintYearAndMonth.h"
#import "Days.h"

int main(int argc, const char * argv[]){
    @autoreleasepool{
        
        int year,yue;
        PrintYearAndMonth *printMonthObj = [[PrintYearAndMonth alloc] init];
        PrintYearAndMonth *printYearObj = [[PrintYearAndMonth alloc] init];
        if (argc == 2) {
            YearAndMonthNow *yearAndMonthNow = [[YearAndMonthNow alloc] init];
            [yearAndMonthNow yearAndMonth];
            year = yearAndMonthNow.yearNow;
            yue = yearAndMonthNow.monthNow;
            
            [printMonthObj printmonth:year yue:yue];
        }
        else if(argc == 3){
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            [printYearObj printyear:[argv2 intValue]];
        }
        else if(argc == 4){
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            NSString *argv3 = [NSString stringWithUTF8String:argv[3]];
            JudgeNumberRegex *judgeNumberRegex = [[JudgeNumberRegex alloc] init];
            BOOL isMonthRegex = [judgeNumberRegex isNumber:argv2];
            BOOL isYearRegex = [judgeNumberRegex isNumber:argv3];
            
            if (isMonthRegex && isYearRegex) {
                [printMonthObj printmonth:[argv3 intValue] yue:[argv2 intValue]];
            }
            else{
                YearAndMonthNow *yearAndMonthNow = [[YearAndMonthNow alloc] init];
                [yearAndMonthNow yearAndMonth];
                year = yearAndMonthNow.yearNow;
                [printMonthObj printmonth:year yue:[argv3 intValue]];
            }
        }
    }
    return 0;
}
