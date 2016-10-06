//
//  calendar.m
//  Mycal
//
//  Created by 李晓雯 on 16/10/5.
//  Copyright © 2016年 李晓雯. All rights reserved.
//

#import "calendar.h"

@implementation calendar
- (void)outputCurrentCalendar{
    //获取当前的年月，调用outputCalendarWithMonth:year: 即可
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth;
    //这句是说你要获取日期的元素有哪些。获取年就要写NSYearCalendarUnit，获取小时就要写NSHourCalendarUnit，中间用|隔开
    NSDateComponents *d = [cal components:unitFlags fromDate:date];
    NSInteger year = [d year];
    NSInteger month = [d month];
    [self outputCalendarWithMonth:month year:year];
}
- (void)outputCalendarWithYear:(NSInteger)year{
    NSArray *monthInChinese = [NSArray arrayWithObjects:@"        零月",@"        一月",@"        二月",@"        三月",@"        四月",@"        五月",@"        六月",@"        七月",@"        八月",@"        九月",@"        十月",@"       十一月",@"       十二月", nil];//每个月对应的中文
    NSString *weekInChinese = @"日 一 二 三 四 五 六";//星期的中文，中文对不齐，改英文了
    NSArray *dayInChinese = [NSArray arrayWithObjects:@"  ",@" 1",@" 2",@" 3",@" 4",@" 5",@" 6",@" 7",@" 8",@" 9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31", nil];//一个月的每天的日期,第一个元素用不到
    NSArray *numberOfDaysOfMonth = [NSArray arrayWithObjects:@"0",@"31",@"28",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];//每个月的天数
    //判断是否为闰年，如果是就把二月天数换成29
    if(year%400==0||(year%4==0&&year%100!=0))
        numberOfDaysOfMonth = [NSArray arrayWithObjects:@"0",@"31",@"29",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    //开始输出
    NSInteger firstDayInYear = ((year-1)+ (year-1)/4-(year-1)/100+(year-1)/400+1)%7;//得到一年第一天是星期几
    NSInteger firstDayInMonth = firstDayInYear;//因为要输出第一年，恰好也是一月第一天的星期几
    NSInteger dayOfBeginning = 7 - firstDayInMonth;//第一行剩下的天数
    NSInteger month;//记录当前输出的月份
    NSString *beginningBlank = [NSString string];//空格的字符串
    NSString *aLineOutput = [NSString string];
    //从一月开始输出
    //NSLog(@"       %li",(long)year);
    printf("       %li\n",(long)year);
    //NSLog(@"");
    for (month = 1; month < 13; month++) {
        NSLog(@"");
        NSLog(@"%@",[monthInChinese objectAtIndex:month]);
        NSLog(@"%@",weekInChinese);
        while (firstDayInMonth != 0) {
            firstDayInMonth --;
            beginningBlank = [beginningBlank stringByAppendingString:@"   "];//每次空3格
            
        }
        aLineOutput = beginningBlank;//先把需要的空白补上
        //把剩下的第一行补全
        for(NSInteger index = 1; index <= dayOfBeginning; index++){
            aLineOutput = [aLineOutput stringByAppendingString:[dayInChinese objectAtIndex:index]];
            if(index!=dayOfBeginning)
                aLineOutput = [aLineOutput stringByAppendingString:@" "];
        }
        NSLog(@"%@",aLineOutput);
        //开始输出剩下的天数，7天往上加，
        dayOfBeginning++;//剩下的开始的日期
        NSString *totalDaysOfMonth = [numberOfDaysOfMonth objectAtIndex:month];
        aLineOutput = [NSString string];//清空之前的内容
        NSInteger nextLineFlag = 0;//7天换一行的标识变量
        while (dayOfBeginning <= totalDaysOfMonth.intValue) {
            if(nextLineFlag != 7 ){
                aLineOutput = [aLineOutput stringByAppendingString:[dayInChinese objectAtIndex:dayOfBeginning]];
                aLineOutput = [aLineOutput stringByAppendingString:@" "];
                nextLineFlag++;
                dayOfBeginning++;
            } else{
                NSLog(@"%@",aLineOutput);
                aLineOutput = [NSString string];
                nextLineFlag = 0;
            }
        }
        NSLog(@"%@",aLineOutput);
        firstDayInMonth = nextLineFlag;
        dayOfBeginning = 7 - firstDayInMonth;
        aLineOutput = [NSString string];
        beginningBlank = [NSString string];
    }
}
- (void)outputCalendarWithMonth:(NSInteger)month year:(NSInteger)year{
    NSArray *monthInChinese = [NSArray arrayWithObjects:@"     零月",@"     一月",@"     二月",@"     三月",@"     四月",@"     五月",@"     六月",@"     七月",@"     八月",@"     九月",@"     十月",@"     十一月",@"     十二月", nil];//每个月对应的中文
    NSString *weekInChinese = @"日 一 二 三 四 五 六";//星期的中文，中文对不齐，改英文了
    NSArray *dayInChinese = [NSArray arrayWithObjects:@"  ",@" 1",@" 2",@" 3",@" 4",@" 5",@" 6",@" 7",@" 8",@" 9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31", nil];//一个月的每天的日期,第一个元素用不到
    NSArray *numberOfDaysOfMonth = [NSArray arrayWithObjects:@"0",@"31",@"28",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];//每个月的天数
    //判断是否为闰年，如果是就把二月天数换成29
    if(year%400==0||(year%4==0&&year%100!=0))
        numberOfDaysOfMonth = [NSArray arrayWithObjects:@"0",@"31",@"29",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    //要知道这个月的第一天是周几，通过这个月的第一天和1.1差的天数来计算
    NSInteger date = 0;//记录时间差
    for (NSInteger index = 1; index < month; index++) {
        NSString *str = [numberOfDaysOfMonth objectAtIndex:index];
        date += str.intValue;
    }
    NSInteger firstDayInMonth = (((year-1)+ (year-1)/4-(year-1)/100+(year-1)/400+1)+date)%7;
    //开始输出
    printf("%s %li\n",[[monthInChinese objectAtIndex:month] UTF8String],year);
    printf("%s\n",[weekInChinese UTF8String]);
    NSInteger dayOfBeginning = 7 - firstDayInMonth;//第一行的最后一天的日期
    NSString *totalDaysOfMonth = [numberOfDaysOfMonth objectAtIndex:month];
    NSString *aLineOutput = [NSString string];
    NSString *beginningBlank = [NSString string];
    while (firstDayInMonth != 0) {
        firstDayInMonth --;
        beginningBlank = [beginningBlank stringByAppendingString:@"   "];//每次空3格
        
    }
    aLineOutput = beginningBlank;
    //把剩下的第一行补全
    for(NSInteger index = 1; index <= dayOfBeginning; index++){
        aLineOutput = [aLineOutput stringByAppendingString:[dayInChinese objectAtIndex:index]];
        if(index!=dayOfBeginning)
            aLineOutput = [aLineOutput stringByAppendingString:@" "];
    }
    printf("%s\n",[aLineOutput UTF8String]);
    aLineOutput = [NSString string];
    dayOfBeginning++;//剩下的开始的日期
    NSInteger nextLineFlag = 0;
    while (dayOfBeginning <= totalDaysOfMonth.intValue) {
        if(nextLineFlag != 7 ){
            aLineOutput = [aLineOutput stringByAppendingString:[dayInChinese objectAtIndex:dayOfBeginning]];
            aLineOutput = [aLineOutput stringByAppendingString:@" "];
            nextLineFlag++;
            dayOfBeginning++;
        } else{
            printf("%s\n",[aLineOutput UTF8String]);
            aLineOutput = [NSString string];
            nextLineFlag = 0;
        }
    }
    printf("%s\n",[aLineOutput UTF8String]);
}
- (void)anotherOutputCalendarWithYear:(NSInteger)year{
    NSArray *seasonInChinese = [NSArray arrayWithObjects:@"        零月                  零月                  零月",@"        一月                  二月                  三月",@"        四月                  五月                  六月",@"        七月                  八月                  九月",@"        十月                 十一月                十二月", nil];//每个季度对应的中文
    NSArray *dayInChinese = [NSArray arrayWithObjects:@"  ",@" 1",@" 2",@" 3",@" 4",@" 5",@" 6",@" 7",@" 8",@" 9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31", nil];//一个月的每天的日期,第一个元素用不到
    NSArray *numberOfDaysOfMonth = [NSArray arrayWithObjects:@"0",@"31",@"28",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];//每个月的天数
    //判断是否为闰年，如果是就把二月天数换成29
    if(year%400==0||(year%4==0&&year%100!=0))
        numberOfDaysOfMonth = [NSArray arrayWithObjects:@"0",@"31",@"29",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    //首先输出查看的年份
    //NSLog(@"                             %li",(long)year);
    printf("                             %li\n\n",(long)year);
    //NSLog(@"                      ");
    //开始输出
    NSInteger firstDayInMonth1 = ((year-1)+ (year-1)/4-(year-1)/100+(year-1)/400+1)%7;//得到一年第一个月第一天是星期几
    NSInteger firstDayInMonth2 = (firstDayInMonth1 + [[numberOfDaysOfMonth objectAtIndex:1] intValue])%7;//第二个月的第一天是星期几
    NSInteger firstDayInMonth3 = (firstDayInMonth2 + [[numberOfDaysOfMonth objectAtIndex:2] intValue])%7;//第三个月的第一天是星期几
    NSInteger dayOfBeginning1 = 7 - firstDayInMonth1;//第一行第一个月剩下的天数
    NSInteger dayOfBeginning2 = 7 - firstDayInMonth2;//第一行第二个月剩下的天数
    NSInteger dayOfBeginning3 = 7 - firstDayInMonth3;//第一行第三个月剩下的天数
    NSInteger season;//记录当前输出的季度
    NSString *beginningBlank1 = [NSString string];//第一个月空格的字符串
    NSString *beginningBlank2 = [NSString string];//第二个月空格的字符串
    NSString *beginningBlank3 = [NSString string];//第三个月空格的字符串
    NSString *aLineOutput = [NSString string];
    //从一月开始输出
    for (season = 1; season < 5; season++) {
        //NSLog(@"%@",[seasonInChinese objectAtIndex:season]);
        printf("%s\n",[[seasonInChinese objectAtIndex:season] UTF8String]);
        //NSLog(@"日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六");
        printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六\n");
        //第一个月的第一行
        while (firstDayInMonth1 != 0) {
            firstDayInMonth1 --;
            beginningBlank1 = [beginningBlank1 stringByAppendingString:@"   "];//每次空3格
            
        }
        aLineOutput = beginningBlank1;//先把需要的空白补上
        //把剩下的第一行补全
        
        for(NSInteger index1 = 1; index1 <= dayOfBeginning1; index1++){
            aLineOutput = [aLineOutput stringByAppendingString:[dayInChinese objectAtIndex:index1]];
            if(index1!=dayOfBeginning1)
                aLineOutput = [aLineOutput stringByAppendingString:@" "];
        }
        aLineOutput = [aLineOutput stringByAppendingString:@"  "];//月与月之间要空2格
        //第二个月的第一行
        while (firstDayInMonth2 != 0) {
            firstDayInMonth2 --;
            beginningBlank2 = [beginningBlank2 stringByAppendingString:@"   "];//每次空3格
        }
        aLineOutput = [aLineOutput stringByAppendingString:beginningBlank2];
        for(NSInteger index2 = 1; index2 <= dayOfBeginning2; index2++){
            aLineOutput = [aLineOutput stringByAppendingString:[dayInChinese objectAtIndex:index2]];
            if(index2!=dayOfBeginning2)
                aLineOutput = [aLineOutput stringByAppendingString:@" "];
        }
        aLineOutput = [aLineOutput stringByAppendingString:@"  "];
        //第三个月的第一行
        while (firstDayInMonth3 != 0) {
            firstDayInMonth3 --;
            beginningBlank3 = [beginningBlank3 stringByAppendingString:@"   "];//每次空3格
        }
        aLineOutput = [aLineOutput stringByAppendingString:beginningBlank3];
        for(NSInteger index3 = 1; index3 <= dayOfBeginning3; index3++){
            aLineOutput = [aLineOutput stringByAppendingString:[dayInChinese objectAtIndex:index3]];
            if(index3 != dayOfBeginning3)
                aLineOutput = [aLineOutput stringByAppendingString:@" "];
        }
        //以上为补全第一行
        //NSLog(@"%@",aLineOutput);
        printf("%s\n",[aLineOutput UTF8String]);
        //开始输出剩下的天数，7天往上加，
        dayOfBeginning1++;//第一个月剩下的开始的日期
        dayOfBeginning2++;//第二个月剩下的开始的日期
        dayOfBeginning3++;//第三个月剩下的开始的日期
        NSString *totalDaysOfMonth1 = [numberOfDaysOfMonth objectAtIndex:(season -1)*3+1];//第一个月的总天数
        NSString *totalDaysOfMonth2 = [numberOfDaysOfMonth objectAtIndex:(season -1)*3+2];//第二个月的总天数
        NSString *totalDaysOfMonth3 = [numberOfDaysOfMonth objectAtIndex:season*3];//第三个月的总天数
        aLineOutput = [NSString string];//清空之前的内容
        NSInteger nextAppear = dayOfBeginning3;//下一个出现的位置是星期几（0-6）
        for (NSInteger blankNumber = 0; blankNumber < 5; blankNumber ++) {
            //第一个月的一个7天
            for (NSInteger index = 0; index < 7; index ++){
                if (blankNumber*7+index+dayOfBeginning1 <= totalDaysOfMonth1.intValue) {
                    aLineOutput = [aLineOutput stringByAppendingString:[dayInChinese objectAtIndex:blankNumber*7+index+dayOfBeginning1]];
                    aLineOutput = [aLineOutput stringByAppendingString:@" "];
                } else{
                    //超过了最大日期，直接补3个空格
                    aLineOutput = [aLineOutput stringByAppendingString:@"   "];
                }
            }
            aLineOutput = [aLineOutput stringByAppendingString:@" "];
            //第二个月的一个7天
            for (NSInteger index = 0; index < 7; index ++){
                if (blankNumber*7+index+dayOfBeginning2 <= totalDaysOfMonth2.intValue) {
                    aLineOutput = [aLineOutput stringByAppendingString:[dayInChinese objectAtIndex:blankNumber*7+index+dayOfBeginning2]];
                    aLineOutput = [aLineOutput stringByAppendingString:@" "];
                } else{
                    //超过了最大日期，直接补3个空格
                    aLineOutput = [aLineOutput stringByAppendingString:@"   "];
                }
            }
            aLineOutput = [aLineOutput stringByAppendingString:@" "];
            //第三个月的一个7天
            for (NSInteger index = 0; index < 7; index ++){
                if (blankNumber*7+index+dayOfBeginning3 <= totalDaysOfMonth3.intValue) {
                    aLineOutput = [aLineOutput stringByAppendingString:[dayInChinese objectAtIndex:(blankNumber*7+index+dayOfBeginning3)]];
                    aLineOutput = [aLineOutput stringByAppendingString:@" "];
                    nextAppear = (index+1)%7;
                } else{
                    //超过了最大日期，直接补3个空格
                    aLineOutput = [aLineOutput stringByAppendingString:@"   "];
                }
            }
            //NSLog(@"%@",aLineOutput);
            printf("%s\n",[aLineOutput UTF8String]);
            aLineOutput = [NSString string];
        }
        beginningBlank1 = [NSString string];//第一个月空格的字符串
        beginningBlank2 = [NSString string];//第二个月空格的字符串
        beginningBlank3 = [NSString string];//第三个月空格的字符串
        // aLineOutput = [NSString string];
        firstDayInMonth1 = nextAppear;
        //对13求余只是防止出现错误，没有第五季度
        firstDayInMonth2 = (nextAppear + [[numberOfDaysOfMonth objectAtIndex:(season*3+1)%13] intValue])%7;//第二个月的第一天是星期几
        firstDayInMonth3 = (nextAppear + [[numberOfDaysOfMonth objectAtIndex:(season*3+1)%13] intValue] +[[numberOfDaysOfMonth objectAtIndex:(season*3+2)%13] intValue])%7;
        dayOfBeginning1 = 7 - firstDayInMonth1;
        dayOfBeginning2 = 7 - firstDayInMonth2;
        dayOfBeginning3 = 7 - firstDayInMonth3;
    }
    
}


- (BOOL)isNumber:(NSString *)str{
    NSString *numberRegex = @"^[0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    return [predicate evaluateWithObject:str];
}
@end

