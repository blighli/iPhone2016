//
//  main.m
//  Cal_XYT
//
//  Created by soulghost on 1/10/2016.
//  Copyright © 2016 xyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYTCall.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *output = nil;
        switch (argc) {
            case 1:
                output = [XYTCall calendarForDate:[NSDate date]];
                break;
            case 2: {// 年份
                int y = atoi(argv[1]);
                output = [XYTCall calendarForYear:y];
                break;
            }
            case 3: {
                int m = atoi(argv[1]);
                int y = atoi(argv[2]);
                NSDateFormatter *formatter = [NSDateFormatter new];
                formatter.dateFormat = @"yyyy-MM";
                NSDate *date = [formatter dateFromString:[NSString stringWithFormat:@"%04d-%02d",y,m]];
                output = [XYTCall calendarForDate:date];
                break;
            }
            default:
                break;
        }
        printf("%s\n",output.UTF8String);
    }
    return 0;
}
