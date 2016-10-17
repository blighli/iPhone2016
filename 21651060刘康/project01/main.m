//
//  main.m
//  project01
//
//  Created by Newcon on 2016/10/8.
//  Copyright © 2016年 Newcon. All rights reserved.
//
//  second commit

#import <Foundation/Foundation.h>
#import "CalBrain.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc > 3) {
            printf("usage: SecondAssignment [-jy] [[month] year]\n");
            printf("SecondAssignment [-j] [-m month] [year]\n");
        } else if (argc == 2) {
            const char *yearStr = argv[1];
            const char *cur = yearStr;
            while (*cur != '\0') {
                char ch = *cur;
                if (ch > '9' || ch < '0') {
                    printf("year %s not in range 1..9999\n", yearStr);
                    return 0;
                }
                cur++;
            }
            int year = atoi(yearStr);
            if (year < 1 || year > 9999) {
                printf("year %s not in range 1..9999\n", yearStr);
                return 0;
            }
            [CalBrain runWithYear:year];
        } else if (argc == 3) {
            const char *yearStr = argv[2];
            const char *monthStr = argv[1];
            const char *cur = yearStr;
            while (*cur != '\0') {
                char ch = *cur;
                if (ch > '9' || ch < '0') {
                    printf("year %s not in range 1..9999\n", yearStr);
                    return 0;
                }
                cur++;
            }
            int year = atoi(yearStr);
            if (year < 1 || year > 9999) {
                printf("year %s not in range 1..9999\n", yearStr);
                return 0;
            }
            cur = monthStr;
            while (*cur != '\0') {
                char ch = *cur;
                if (ch > '9' || ch < '0') {
                    printf("%s is neither a month number (1..12) nor a name\n", monthStr);
                    return 0;
                }
                cur++;
            }
            int month = atoi(monthStr);
            if (month < 1 || month > 12) {
                printf("%s is neither a month number (1..12) nor a name\n", monthStr);
                return 0;
            }
            [CalBrain runWithYear:year month:month];
        }
    }
    return 0;
}
