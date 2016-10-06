//
//  main.m
//  Mycal
//
//  Created by 李晓雯 on 16/10/5.
//  Copyright © 2016年 李晓雯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "calendar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        calendar *aCalendar = [[calendar alloc]init];
        if (argc == 1) {
            //表示要执行 cal 命令
            [aCalendar outputCurrentCalendar];
        } else if (argc == 2){
            //执行 cal 年 命令
            //把年份是否是数字判断出来
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            NSInteger year = argv1.intValue;
            //NSScanner *scanner = [NSScanner scannerWithString:argv2];
            calendar *judgeNumber = [calendar new];
            if (![judgeNumber isNumber:argv1]) {
                //不是一个纯数字
                printf("格式错误: year 0 not in range 1..9999");
            } else if (year>=1&&year<=9999) {
                //数字正常
                [aCalendar anotherOutputCalendarWithYear:year];
            } else if (year>=0){
                printf("格式错误: year %zi not in range 1..9999",year);
            } else{
                //是一个负数,这个是不是能走到？
                printf("格式错误: illegal option");
            }
        } else if (argc == 3){
            //  执行 cal 月份 年 命令
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            NSInteger year = argv2.intValue;
            calendar *judgeNumber = [calendar new];
            if (![judgeNumber isNumber:argv2]) {
                printf("格式错误: year 0 not in range 1..9999");
                return 0;
            } else if (year>=1&&year<=9999) {
                //数字正常,继续判断月份
                //[aCalendar outputCalendarWithYear:year];
            } else if (year>=0){
                printf("格式错误: year %zi not in range 1..9999",year);
                return 0;
            } else{
                //是一个负数,这个是不是能走到？ 是的，不能走到，判断有没有 - ？
                printf("格式错误: illegal option");
                return 0;
            }
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            NSInteger month = argv1.intValue;
            if (![judgeNumber isNumber:argv1]) {
                //不是一个数字
                NSLog(@"cal: %@ is neither a month number (1..12) nor a name",argv1);
            } else if (month>=1&&month<=12){
                //可以输出了
                [aCalendar outputCalendarWithMonth:month year:year];
            } else{
                NSLog(@"cal: %zi is neither a month number (1..12) nor a name",month);
            }
        }
        return 0;
    }
}
