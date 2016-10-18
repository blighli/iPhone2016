//
//  main.m
//  MyCal
//
//  Created by yangfeiyu on 16/10/4.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "getWeekOfDay.h"
#import "monthData.h"
#import "yearData.h"
#pragma clang diagnostic ignored "-Wmissing-selector-name"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        if(argc == 1){
            int now = [caldate getNowDate];
            now /= 100;
            int month = now % 100;
            int year = now / 100;
            
            monthData *data = [[monthData alloc] init];
            [data setMonthData:year:month];
            [data printMonthData];
        }else if (argc == 2){
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            BOOL flag = [caldate isNumber:argv1];
            if(flag == false){
                [caldate printEx];
                return 0;
            }else{
                int year = [argv1 intValue];
                if(year < 1800 || year > 9999){
                    printf("year not in range 1800..9999,please try again\n");
                    return 0;
                }
                yearData *yy = [[yearData alloc] init];
                [yy setYearData:year];
                [yy printYearData];
            }
        }else if (argc == 3){
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            BOOL flag1 = [caldate isNumber:argv1];
            BOOL flag2 = [caldate isNumber:argv2];
            if(flag1 && flag2 ){
                int month = [argv1 intValue];
                int year = [argv2 intValue];
                if(month < 1 || month > 12){
                    printf("month not in range 1..12,please try again\n");
                    return 0;
                }else if(year < 1800 || year > 9999){
                    printf("year not in range 1800..9999,please try again\n");
                    return 0;
                }
                monthData *data = [[monthData alloc] init];
                [data setMonthData:year:month];
                [data printMonthData];
            }else if([argv1 isEqualToString:@"-m"] && flag2){
                int month = [argv2 intValue];
                if(month < 1 || month > 12){
                    printf("month not in range 1..12,please try again\n");
                    return 0;
                }
                monthData *data = [[monthData alloc] init];
                [data setMonthData:2016:month];
                [data printMonthData];
            }else{
                printf("sorry,you can input like this:./cal -m 5\n");
                return 0;
            }
        }else{
            printf("too many parameters in your input,please try again");
        }
        
        
    }
    return 0;
}
