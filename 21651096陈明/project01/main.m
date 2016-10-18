//
//  main.m
//  Project1
//
//  Created by chenming on 16/10/7.
//  Copyright © 2016年 chenming. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Cal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Cal *cal = [[Cal alloc]init];
        if (argc == 1) {
            //"Cal"
            [cal printNowMonth];
        } else if (argc == 2){
            //"Cal 2016"
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            for (int i=0;i<[argv1 length];i++) {
                char s = [argv1 characterAtIndex:i] ;
                if(s<'0'||s>'9'){
                    NSLog(@"year %@ not in range 1..9999",argv1);
                    return 0;
                }
            }
            int year = argv1.intValue;
            if(year<1||year>9999){
                NSLog(@"year %d not in range 1..9999",year);
                return 0;
            }
            [cal printNowYear:year];
        } else if (argc == 3){
            //"Cal 5 2016"
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            for (int i=0;i<[argv2 length];i++) {
                char s = [argv2 characterAtIndex:i] ;
                if(s<'0'||s>'9'){
                    NSLog(@"year %@ not in range 1..9999",argv2);
                    return 0;
                }
            }
            int year = argv2.intValue;
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            for (int i=0;i<[argv1 length];i++) {
                char s = [argv1 characterAtIndex:i] ;
                if(s<'0'||s>'9'){
                    NSLog(@"month %@ is neither a month number (1..12)",argv1);
                    return 0;
                }
            }
            int month = argv1.intValue;
            if(year<1||year>9999){
                NSLog(@"year %d not in range 1..9999",year);
                return 0;
            }
            if(month<1||month>12){
                NSLog(@"month %d is neither a month number (1..12)",month);
                return 0;
            }
            [cal printMonth:month andYear:year];
        }else{
            NSLog(@"too many parameters");
            return 0;
        }
        return 0;
    }
}


