//
//  main.m
//  calendar
//
//  Created by 李江浩 on 16/9/29.
//  Copyright © 2016年 李江浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "calendar.h"
#import "judgeNumberRegex.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        calendar *aCalendar = [[calendar alloc]init];
//        [aCalendar anotherOutputCalendarWithYear:2016];
        //NSLog(@"TEST CANENDAR");“拖拽进去的绝对路径就相当于 cal ”
//        NSString *argv1 = [NSString string];
//        if (argv[1]) {
//            argv1 = [NSString stringWithUTF8String:argv[1]];
//            NSLog(@"argv1 = %@",argv1);
//            if (![argv1 isEqualToString:@"cal"]) {
//                NSLog(@"%@: command not found",argv1);
//                return 0;
//            }
//        }
        if (argc == 1) {
            //表示要执行 cal 命令
            [aCalendar outputCurrentCalendar];
        } else if (argc == 2){
            //执行 cal 年 命令
            //把年份是否是数字判断出来
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            NSInteger year = argv1.intValue;
            //NSScanner *scanner = [NSScanner scannerWithString:argv2];
            judgeNumberRegex *judgeNumber = [[judgeNumberRegex alloc]init];
            if (![judgeNumber isNumber:argv1]) {
                //不是一个纯数字
                NSLog(@"cal: year 0 not in range 1..9999");
            } else if (year>=1&&year<=9999) {
                //数字正常
                [aCalendar anotherOutputCalendarWithYear:year];
            } else if (year>=0){
                NSLog(@"cal: year %zi not in range 1..9999",year);
            } else{
                //是一个负数,这个是不是能走到？
                NSLog(@"cal: illegal option");
            }
        } else if (argc == 3){
            //  执行 cal 月份 年 命令
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            NSInteger year = argv2.intValue;
            judgeNumberRegex *judgeNumber = [[judgeNumberRegex alloc]init];
            if (![judgeNumber isNumber:argv2]) {
                //不是一个数字
                NSLog(@"cal: year 0 not in range 1..9999");
                return 0;
            } else if (year>=1&&year<=9999) {
                //数字正常,继续判断月份
                //[aCalendar outputCalendarWithYear:year];
            } else if (year>=0){
                NSLog(@"cal: year %zi not in range 1..9999",year);
                return 0;
            } else{
                //是一个负数,这个是不是能走到？ 是的，不能走到，判断有没有 - ？
                NSLog(@"cal: illegal option");
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
