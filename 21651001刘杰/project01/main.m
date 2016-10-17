//
//  main.m
//  cal
//
//  Created by 刘杰 on 16/10/8.
//  Copyright © 2016年 刘杰. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Calender.h"

bool isMonth(NSUInteger month)
{
    return month >= 1 && month <= 12;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //showCalendar(2015, 1, 12, 5);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDate *date = [NSDate date];
        NSUInteger unFlag = (NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday);
        
        NSDateComponents *compt = [calendar components:unFlag fromDate:date];
        NSUInteger month = [compt month];
        NSUInteger year = [compt year];
        
        //处理命令行
        for (int i = 0; i < argc; i++)
            printf("%s ", argv[i]);
        printf("\n");
        @try {
            if (argc == 1)
				[LJCalender showCalendar:year minMonth:month maxMonth:month times:1];
            else
            {
                NSException *exception = [NSException exceptionWithName:@"CommandException" reason:@"Command Error" userInfo:nil];
                if (argv[1][0] == '-')
                {
					if (argv[1][1] == 'm' && argc == 3 && [LJCalender isLegal:argv[2]])
                        month = atoi(argv[2]);
                    else @throw exception;
                    if (!isMonth(month))
                        @throw exception;
                    [LJCalender showCalendar:year minMonth:month maxMonth:month times:1];
                }
                else
                {
                    for (int i = 1; i < argc; i++)
                        if (![LJCalender isLegal:argv[i]])
                            @throw exception;
                    if (argc == 3)
                    {
                        month = atoi(argv[1]);
                        if (!isMonth(month))
                            @throw exception;
                        year = atoi(argv[2]);
                        [LJCalender showCalendar:year minMonth:month maxMonth:month times:1];                    }
                    else if (argc == 2)
                    {
                        year = atoi(argv[1]);
                        [LJCalender showCalendar:year minMonth:1 maxMonth:12 times:3];
                    }
                    //for test
                    else if (argc == 5)
                    {
                        NSUInteger minMonth = atoi(argv[1]);
                        NSUInteger maxMonth = atoi(argv[2]);
                        if (!isMonth(minMonth) || !isMonth(maxMonth)) {
                            @throw exception;
                        }
                        NSUInteger year = atoi(argv[3]);
                        NSUInteger times = atoi(argv[4]);
                        [LJCalender showCalendar:year minMonth:month maxMonth:month times:times];
                    }
                    else
                    {
                        @throw exception;
                    }
                    
                }
            }
        }
        @catch (NSException *exception) {
            NSLog(@"%@: parameter is illegal!", exception);
        }
        @finally {
        }
        
    }
    return 0;
}
