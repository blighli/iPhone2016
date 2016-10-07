//
//  main.m
//  CalTest
//
//  Created by 刘凯敏 on 16/10/4.
//  Copyright © 2016年 Apress. All rights reserved.
//

/*
 要求：
 1.运行cal，输出当月的月历；
 2.运行cal 2016,输出2016年的月历；
 3.运行cal 10 2016,输出2016年10月的月历；
 
 */

#import <Foundation/Foundation.h>
#import "YearAndMonthNow.h"
#import "JudgeNumberRegex.h"
#import "PrintYearAndMonth.h"
#import "Days.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool{
        
        int year,yue;
        PrintYearAndMonth *printMonthObj = [[PrintYearAndMonth alloc] init];
        PrintYearAndMonth *printYearObj = [[PrintYearAndMonth alloc] init];
        
        if (argc == 2) {
            //1.执行“cal”命令；
            //执行该命令时argc = 2;argv[1] = cal;argv[2] = null
            
            //计算当前年月；
            YearAndMonthNow *yearAndMonthNow = [[YearAndMonthNow alloc] init];
            [yearAndMonthNow yearAndMonth];
            
            year = yearAndMonthNow.yearNow;
            yue = yearAndMonthNow.monthNow;
            
            [printMonthObj printmonth:year yue:yue];
            
        }
        
        else if(argc == 3){
            //4.执行“cal 2016”命令；
            
            //这个argv2表示年份；
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            JudgeNumberRegex *judgeNumberRegex = [[JudgeNumberRegex alloc] init];
            BOOL isYearRegex = [judgeNumberRegex isNumber:argv2];
            
            if (isYearRegex) {

                [printYearObj printyear:[argv2 intValue]];
            }
            else{
                NSLog(@"输入有误！");
            }
            
        }
        
        else if(argc == 4){
            //2.执行“cal 10 2016”命令；
            //这一步是为了把传递进来的char * argv参数转化为 OC中的NSString；
            //    NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            NSString *argv3 = [NSString stringWithUTF8String:argv[3]];
            
            JudgeNumberRegex *judgeNumberRegex = [[JudgeNumberRegex alloc] init];
            BOOL isMonthRegex = [judgeNumberRegex isNumber:argv2];
            BOOL isYearRegex = [judgeNumberRegex isNumber:argv3];
            
            if (isMonthRegex && isYearRegex && [argv2 intValue] < 13) {
                //执行该命令时，argc = 4,argv[1] = cal,argv[2] = 10,argv[3] = 2014;
                //需要把数字字符串转化为整型；
                
                [printMonthObj printmonth:[argv3 intValue] yue:[argv2 intValue]];
            }
            else{
                NSLog(@"输入有误！");
            }

        }  
        
    }  
    
    
    return 0;  
}
