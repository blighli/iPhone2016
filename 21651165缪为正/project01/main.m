//
//  main.m
//  project1
//
//  Created by 缪为正 on 16-10-4.
//  Copyright (c) 2016年 缪为正. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "calendar.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        calendar *cal = [calendar alloc];
        cal = [cal init];
        if (argc==1) {
            [cal printYearAndMonthNow];
            [cal printYear:(int)[cal monthNow] AndMonth:(int)[cal yearNow]];
        }else if (argc==2){
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", [NSString stringWithFormat:@"^[0-9]+$"]];
            if ([pred evaluateWithObject:argv1] ) {
                [cal printYear:[argv1 intValue]];
            }else{
                NSLog(@"输入的年份不正确！");
            }
        }else if (argc==3){
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", [NSString stringWithFormat:@"^[0-9]+$"]];
            if (![pred evaluateWithObject:argv1] ) {
                NSLog(@"输入的年份不正确！");
            }
            else if (![pred evaluateWithObject:argv2] || [argv2 intValue]>12 || [argv2 intValue]<0) {
                NSLog(@"输入的月份不正确！");
            }else{
                [cal printYear:[argv1 intValue] AndMonth:[argv2 intValue]];
            }
        }else{
            NSLog(@"参数错误！");
        }

    }
    return 0;
}

