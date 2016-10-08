
//  main.m
//  calendar
//
//  Created by lxy on 16/10/8.
//  Copyright © 2016年 lxy. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AppDelegate.h"
#import "Month.h"


int main(int argc, char * argv[]) {

    Month* calmonth = [[Month alloc] init];

    if(argc == 1){
        //run“cal”
        NSInteger year = 0;
        NSInteger month = 0;
        NSInteger day = 0;
        NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate* date = [NSDate date];
        year = [calendar component:NSCalendarUnitYear fromDate:date];
        month = [calendar component:NSCalendarUnitMonth fromDate:date];
        day = [calendar component:NSCalendarUnitDay fromDate:date];
        //printf(year);
        //printf(month);
        [calmonth calMonth:month AndYear: year AndDay:day];
      
        
        
    }
    else if(argc == 2){
        //run"cal year"
        NSInteger year = atoi(argv[1]);
        if (year>=1 && year<=9999) {
           [calmonth calYear: year];
        }
        else {
            printf("Year must be in range 1..9999\n");
        }
        
    }
    else if(argc == 3){
        //run"cal month year"
        NSInteger month = atoi(argv[1]);
        NSInteger year = atoi(argv[2]);
        
        if (month>=1 && month<=12) {
            if (year>=1 && year<=9999) {
                [calmonth calMonthYear:month AndYear: year];
            } else {
                printf("Year must be in range 1..9999\n");
            }
        }  else {
            printf("Month must be in range 1..12\n");
        }

    }
    else{
        printf("input wrong dateformat");
    }
    return 0;
}




