/*
 要求：
 1.运行cal，输出当月的月历；
 2.运行cal 10 2014,输出2014年10月的月历；
 3.运行cal -m 10,输出当年10月的月历；
 4.运行cal 2014,输出2014年的月历；
 
 */

/*
 注意事项：
 1.年份是从 1...9999的；
 2.月份是从  1...12的；
 
 
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
    
        if (argc == 1) {
            //1.执行“cal”命令；
            //执行该命令时argc = 1;argv[1] = null
            
            //计算当前年月；
            YearAndMonthNow *yearAndMonthNow = [[YearAndMonthNow alloc] init];
            [yearAndMonthNow yearAndMonth];
            
            year = yearAndMonthNow.yearNow;
            yue = yearAndMonthNow.monthNow;
            
            [printMonthObj printmonth:year yue:yue];
            
        }
        
        else if(argc == 2){
            //4.执行“cal 2014”命令；
            
            //这个argv1表示年份；
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            int temp = [argv1 intValue];
            if(temp>9999||temp<1)
            {
                printf("cal: year %d not in range 1..9999\n",temp);
                return 0;
            }
            else [printYearObj printyear:[argv1 intValue]];
            
        }
        
        else if(argc == 3){
            //2.执行“cal 10 2014”命令；
            //这一步是为了把传递进来的char * argv参数转化为 OC中的NSString；
            //    NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
            NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
            int temp1 = [argv1 intValue];
            int temp2 = [argv2 intValue];
            if(temp2>9999||temp2<1)
            {
                printf("cal: year %d not in range 1..9999\n",temp2);
                return 0;
            }else if(temp1>12||temp1<1)
            {
                printf("cal: %d is neither a month number (1..12) nor a name\n",temp1);
                return 0;
            }else
            {
                JudgeNumberRegex *judgeNumberRegex = [[JudgeNumberRegex alloc] init];
                BOOL isMonthRegex = [judgeNumberRegex isNumber:argv1];
                BOOL isYearRegex = [judgeNumberRegex isNumber:argv2];
            
                if (isMonthRegex && isYearRegex) {
                    //执行该命令时，argc = 4,argv[1] = cal,argv[2] = 10,argv[3] = 2014;
                    //需要把数字字符串转化为整型；
                
                    [printMonthObj printmonth:[argv2 intValue] yue:[argv1 intValue]];
                
                
                }
                else{
                    //3.执行“cal -m 10”命令；
                    //需要输出本年的10月份日历；
                    //注意这里和上一个if的差异：这里的月份是在第三个参数的；
                    YearAndMonthNow *yearAndMonthNow = [[YearAndMonthNow alloc] init];
                    [yearAndMonthNow yearAndMonth];
                    year = yearAndMonthNow.yearNow;
                
                    [printMonthObj printmonth:year yue:[argv2 intValue]];
                
                }
            }
            
        }
        
    }
    
    
    return 0;
}
