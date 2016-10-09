//
//  main.m
//  CAL_TEST1
//
//  Created by xuanmiao on 16/10/7.
//  Copyright © 2016年 xuanmiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YearAndMonthNow.h"
#import "JudgeNumberRegex.h"
#import "PrintYearAndMonth.h"
#import "Days.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 输入年，月
        int year , yue;
        PrintYearAndMonth * printMonthObj = [[PrintYearAndMonth alloc]init];
        PrintYearAndMonth * printYearObj = [[PrintYearAndMonth alloc]init];
        //判断输入几个参数，第一个为cal，根据是否有第二个，第三个参数来选择输出模式
        if (argc == 2) {
            //执行"cal"命令
            //执行该命令时，argc=2,argv[1]=cal,argv[2]=null
            
            //计算当前年月
            YearAndMonthNow * yearAndMonthNow = [[YearAndMonthNow alloc]init];
            [yearAndMonthNow yearAndMonth];
            year = yearAndMonthNow.yearNow;
            yue = yearAndMonthNow.monthNow;
            
            [printMonthObj printmonth:year yue:yue];
        }else if (argc == 3){
            //执行"cal 年份"命令
            //执行该命令时，argc=3,argv[1]=cal,argv[2]=2014，argv[3]=null
            
            NSString * argv2 = [NSString stringWithUTF8String:argv[2]];
            
            
            JudgeNumberRegex * judgeNumberRegex = [[JudgeNumberRegex alloc]init];
            BOOL isYearRegex = [judgeNumberRegex isNumber:argv2];
            if (!isYearRegex) {
                //判断输入是否为数字
                printf("cal: year is not in range 1..9999\n");
            }else if ([argv2 intValue] < 1 || [argv2 intValue] > 9999){
                //判断年份是否在范围内
                printf("cal: year is not in range 1..9999\n",[argv2 intValue]);
            }else{
                [printYearObj printyear:[argv2 intValue]];
            }
            
        }else if (argc == 4){
            //执行"cal 月份 年份"命令
            //执行该命令时，argc=4,argv[1]=cal,argv[2]=9,argv[3]=1993,argv[4]=null
            
            NSString * argv2 = [NSString stringWithUTF8String:argv[2]];
            NSString * argv3 = [NSString stringWithUTF8String:argv[3]];
            
            JudgeNumberRegex * judgeNumberRegex = [[JudgeNumberRegex alloc]init];
            BOOL isMonthRegex =[judgeNumberRegex isNumber:argv2];
            BOOL isYearRegex = [judgeNumberRegex isNumber:argv3];
            
            if (isMonthRegex == true && isYearRegex == true) {
                //判断年份是否在1~9999范围
                if ([argv3 intValue] < 1 || [argv3 intValue] > 9999) {
                    printf("cal: year is not in range 1..9999\n",[argv3 intValue]);
                }else if ([argv2 intValue] < 1 || [argv2 intValue] > 12){
                    //判断月份是否超出范围
                    printf("cal: %d is neither a month number (1..12)\n",[argv2 intValue]);
                }else{
                    [printMonthObj printmonth:[argv3 intValue] yue:[argv2 intValue]];
                }
            }else if (isMonthRegex == true && isYearRegex == false){
                printf("cal: year 0 not in range 1..9999\n");
            }else if(isMonthRegex == false && isYearRegex == true){
                printf("cal: %s is neither a month number (1..12)\n",argv[2]);
            }
            
            
        }
    }
    return 0;
}
