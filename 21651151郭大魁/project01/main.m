//
//  main.m
//  Cal_Dakui
//
//  Created by dakui on 7/10/2016.
//  Copyright © 2016 dakui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DKCal.h"

void dealParams(int argc, const char ** argv);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        dealParams(argc, argv);
    }
    return 0;
}

void dealParams(int argc, const char ** argv) {
    DKCal *cal = [DKCal sharedCal];
    NSString *output = nil;
    switch (argc) {
        case 1:
            output = [cal calendarForDate:[NSDate date]];
            break;
        case 2: {
            int y = atoi(argv[1]);
            if (y < 1 || y >= 9999) {
                output = [NSString stringWithFormat:@"cal: year %d not in range 1..9999", y];
                break;
            }
            output = [cal calendarForYear:y];
            break;
        }
        case 3: {
            int m = atoi(argv[1]);
            int y = atoi(argv[2]);
            if ((y < 1 || y >= 9999)) {
                output = [NSString stringWithFormat:@"cal: year %d not in range 1..9999", y];
                break;
            }
            if ((m < 1 || m > 12)) {
                output = [NSString stringWithFormat:@"cal: %d is not a month number (1..12)", m];
                break;
            }
            NSDateFormatter *formatter = [NSDateFormatter new];
            formatter.dateFormat = @"yyyy-MM";
            NSDate *date = [formatter dateFromString:[NSString stringWithFormat:@"%04d-%02d",y,m]];
            output = [cal calendarForDate:date];
            break;
        }
        default:
            break;
    }
    printf("%s\n", output.UTF8String);
}
