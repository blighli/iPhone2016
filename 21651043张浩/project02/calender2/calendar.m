
#import "calendar.h"

@implementation calendar
- (NSArray *)outputCalendarWithMonth:(NSInteger)month year:(NSInteger)year{
    NSArray *result = [NSArray array];
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
    //NSLog(@"%@ %li",[monthInChinese objectAtIndex:month],year);
    //printf("%s %li\n",[[monthInChinese objectAtIndex:month] UTF8String],year);
    //NSLog(@"%@",weekInChinese);
    //printf("%s\n",[weekInChinese UTF8String]);
    result = [result arrayByAddingObject:weekInChinese];
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
    //NSLog(@"%@",aLineOutput);
    //printf("%s\n",[aLineOutput UTF8String]);
    result = [result arrayByAddingObject:aLineOutput];
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
            //NSLog(@"%@",aLineOutput);
            //printf("%s\n",[aLineOutput UTF8String]);
            result = [result arrayByAddingObject:aLineOutput];
            aLineOutput = [NSString string];
            nextLineFlag = 0;
        }
    }
    //NSLog(@"%@",aLineOutput);
    //printf("%s\n",[aLineOutput UTF8String]);
    result = [result arrayByAddingObject:aLineOutput];
    return result;
}

@end
