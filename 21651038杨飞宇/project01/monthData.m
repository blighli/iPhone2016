//
//  monthData.m
//  MyCal
//
//  Created by yangfeiyu on 16/10/5.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//

#import "monthData.h"
#import "getWeekOfDay.h"
#pragma clang diagnostic ignored "-Wmissing-selector-name"
@implementation monthData
-(void) setMonthData:(int)year :(int)month{
    _year = year;
    int days = [caldate howManyDaysInThisMonth:year:month];
    NSString *yearStr = [NSString stringWithFormat:@"  %d",year];
    
   // if(year == 0){
    yearAndMonth = [caldate monthEnglish:month];
//    }else{
//        yearAndMonth = [[caldate monthEnglish:month] stringByAppendingString:yearStr];
//    }
    
    int nowtime = year*10000 + month*100 + 1;
    
    int firstDayOfMonth = [caldate weekdayStringFromDate:nowtime];
    //printf("fist----%d\n",firstDayOfMonth);
    int count = 1;
    int i = 0;
    int j = 0;
    while (count <= days) {
        if(count == 1){
            j = firstDayOfMonth;
            day[i][j] = count;
        }else{
            day[i][j] = count;
        }
        count++;
        j++;
        if(j == 7){
            j = 0;
            i++;
        }
    }
}

-(void) printMonthData{
    //NSLog(@"%@\n",yearAndMonth);
    printf("     %s  %d\n",[yearAndMonth UTF8String],_year);
    printf("Su Mo Tu We Th Fr Sa\n");
    for (int i = 0; i < 6; i++) {
        for (int j = 0 ; j < 7; j++) {
            if(day[i][j] == 0){
                printf("   ");
            }else{
                
                if(day[i][j] < 10){
                    printf(" %d ",day[i][j]);
                }else{
                    printf("%d ",day[i][j]);
                }
            }
        }
        printf("\n");
    }
}
@end
