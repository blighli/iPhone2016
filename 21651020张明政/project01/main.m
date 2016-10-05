//
//  main.m
//  project01
//
//  Created by Benjamin on 16/10/3.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YearAndMonthNow.h"
#import "JudgeNumberRegex.h"
#import "PrintYearAndMonth.h"
#import "Days.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int year , yue;
        PrintYearAndMonth * printMonthObj = [[PrintYearAndMonth alloc]init];
        PrintYearAndMonth * printYearObj = [[PrintYearAndMonth alloc]init];
        
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
            //执行"cal 2014"命令
            //执行该命令时，argc=3,argv[1]=cal,argv[2]=2014
            
            NSString * argv2 = [NSString stringWithUTF8String:argv[2]];
            
            
            JudgeNumberRegex * judgeNumberRegex = [[JudgeNumberRegex alloc]init];
            BOOL isYearRegex = [judgeNumberRegex isNumber:argv2];
            if (!isYearRegex) {
                //判断输入是否为数字
                printf("cal: year 0 not in range 1..9999\n");
            }else if ([argv2 intValue] < 1 || [argv2 intValue] > 9999){
                //判断年份是否在范围内
                printf("cal: year %d not in range 1..9999\n",[argv2 intValue]);
            }else{
                [printYearObj printyear:[argv2 intValue]];
            }
            
        }else if (argc == 4){
            //执行"cal 9 1993"命令
            //执行该命令时，argc=4,argv[1]=cal,argv[2]=9,argv[3]=1993
            
            NSString * argv2 = [NSString stringWithUTF8String:argv[2]];
            NSString * argv3 = [NSString stringWithUTF8String:argv[3]];
            
            JudgeNumberRegex * judgeNumberRegex = [[JudgeNumberRegex alloc]init];
            BOOL isMonthRegex =[judgeNumberRegex isNumber:argv2];
            BOOL isYearRegex = [judgeNumberRegex isNumber:argv3];
            
            if (isMonthRegex == true && isYearRegex == true) {
                //判断年份是否超出范围
                if ([argv3 intValue] < 1 || [argv3 intValue] > 9999) {
                    printf("cal: year %d not in range 1..9999\n",[argv3 intValue]);
                }else if ([argv2 intValue] < 1 || [argv2 intValue] > 12){
                //判断月份是否超出范围
                    printf("cal: %d is neither a month number (1..12) nor a name\n",[argv2 intValue]);
                }else{
                    [printMonthObj printmonth:[argv3 intValue] yue:[argv2 intValue]];
                }
            }else if (isMonthRegex == true && isYearRegex == false){
                printf("cal: year 0 not in range 1..9999\n");
            }else if(isMonthRegex == false && isYearRegex == true){
                printf("cal: %s is neither a month number (1..12) nor a name\n",argv[2]);
            }
            
            
            /*
            else{
                
                //执行“cal -m 10”
                YearAndMonthNow * yearAndMonthNow = [[YearAndMonthNow alloc]init];
                [yearAndMonthNow yearAndMonth];
                year = yearAndMonthNow.yearNow;
                [printMonthObj printmonth:year yue:[argv3 intValue]];
             
            }
            */
        }
        
/*
///////////////////////////////////////////////测试
        
        //输出当前年月
//        YearAndMonthNow * a=[[YearAndMonthNow alloc]init];
//        [a yearAndMonth];
        
        //判断是否为数字
//        JudgeNumberRegex * b=[[JudgeNumberRegex alloc]init];
//        [b isNumber:@"123987"];
        
        //计算从公元0年到你输入的上一年总共有多少天
//        Days * c=[[Days alloc]init];
//        [c daysOfUntilLastYear:3];
        
        //输出一个月的日历
//        PrintYearAndMonth * d = [[PrintYearAndMonth alloc]init];
//        [d printmonth:2017 yue:3];

        //输出一年的日历
//        PrintYearAndMonth * e= [[PrintYearAndMonth alloc]init];
//        [e printyear:2015];
 
*/
        
        
    }
    return 0;
}
