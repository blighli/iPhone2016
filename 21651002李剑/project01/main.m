//
//  main.m
//  cal
//
//  Created by 李剑 on 16/10/5.
//  Copyright © 2016年 mutouren. All rights reserved.
//

#import <Foundation/Foundation.h>
//根据kind的值，从date中提取weekday、day、month或year等的值
NSInteger getValueOfDateComponentKindOfDate(NSCalendarUnit kind, NSDate *date)
{
    NSCalendar *gregorianCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    return [gregorianCalendar component:kind fromDate:date];
}
//将数字month转化为NSString
NSString *getMonthString(NSInteger month)
{
    switch (month) {
        case 1:
            return @"一月";
            break;
        case 2:
            return @"二月";
            break;
        case 3:
            return @"三月";
            break;
        case 4:
            return @"四月";
            break;
        case 5:
            return @"五月";
            break;
        case 6:
            return @"六月";
            break;
        case 7:
            return @"七月";
            break;
        case 8:
            return @"八月";
            break;
        case 9:
            return @"九月";
            break;
        case 10:
            return @"十月";
            break;
        case 11:
            return @"十一月";
            break;
        case 12:
            return @"十二月";
            break;
    }
    return @"unvalid month";
}
//获取某年某月第一天的date值
NSDate *getFirstDayOfMonthInYear(NSInteger month, NSInteger year)
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];
    [components setMonth:month];
    [components setYear:year];
    NSCalendar *gregorianCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    return [gregorianCalendar dateFromComponents:components];
}
//获取某年某月的天数
NSInteger getNumberOfDaysInMonthOfYear(NSInteger month, NSInteger year)
{
    NSCalendar *gregorianCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:month];
    [components setYear:year];
    [components setDay:28];
    NSDate *date = [gregorianCalendar dateFromComponents:components];
    NSDate *nextDay = [date dateByAddingTimeInterval:86400];
    for (int i = 28; i <= 30; i++)
    {
        //[components setday];//86400
        NSInteger monthOfNextDay = getValueOfDateComponentKindOfDate(NSCalendarUnitMonth, nextDay);
        if (month != monthOfNextDay) return i;
        nextDay = [nextDay dateByAddingTimeInterval:86400];
    }
    return 31;
}
//获取某年某月的数据模型
void getMonthModel(NSInteger month, NSInteger year, NSInteger model[][7])
{
    NSInteger weekDay = getValueOfDateComponentKindOfDate(NSCalendarUnitWeekday, getFirstDayOfMonthInYear(month, year));
    NSInteger number = getNumberOfDaysInMonthOfYear(month, year);
    NSInteger k = 1;
    for (NSInteger i = weekDay - 1; i < weekDay - 1 + number; i++)
    {
        model[i / 7][i % 7] = k;
        k++;
    }
}
//初始化矩阵，用6*7的矩阵代表一个月的天数分布模型，在打印的时候，值为0打印空格
void resetMonthModel(NSInteger model[6][7])
{
	for (int i = 0; i < 6; i++)
		for (int j = 0; j < 7; j++)
			model[i][j] = 0;
}
//输出某年某月
void printMonthOfYear(NSInteger month, NSInteger year)
{
	NSInteger model[6][7];// = {{0,0,0,0,0,0,0}, {0,0,0,0,0,0,0}, {0,0,0,0,0,0,0}, {0,0,0,0,0,0,0},{0,0,0,0,0,0,0}, {0,0,0,0,0,0,0}};
	resetMonthModel(model);
    getMonthModel(month, year, model);
    printf("    %s  %ld\n", [getMonthString(month) UTF8String],(long)year);
    printf("日 一 二 三 四 五 六\n");
    for (int i = 0; i < 6; i++)
    {
        for (int j = 0; j < 7; j++)
        {
            if (model[i][j] == 0) printf("   ");
            else printf("%2ld ", model[i][j]);
        }
        printf("\n");
    }
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        switch (argc) {
            case 1://没有参数，打印当年
            {
                NSInteger month = getValueOfDateComponentKindOfDate(NSCalendarUnitMonth, [NSDate date]);
                NSInteger year = getValueOfDateComponentKindOfDate(NSCalendarUnitYear, [NSDate date]);
                printMonthOfYear(month, year);
                
                break;
            }
            case 2://一个参数，打印该参数对应的年份
            {
                NSString *yearString = [NSString stringWithUTF8String:argv[1]];
                NSInteger year = [yearString integerValue];
				if (year < 0)
				{
					NSLog(@"%@ is not a valid year number", yearString);
					break;
				}
                NSInteger yearModel[24][21];//24*21的矩阵代表12个月的天数分布
                for (int i = 0; i < 24; i++)
                    for (int j = 0; j < 21; j++)
                        yearModel[i][j] = 0;//初始化
                NSInteger monthModel[6][7];
                
                for (int i = 0; i < 4; i++)//4行
                {
                    for (int j = 0; j < 3; j++)//3列
                    {
                        resetMonthModel(monthModel);
                        getMonthModel(i * 3 + j + 1, year, monthModel);//获取第i * 3 + j + 1个月的数据模型
                        for (int m = 0; m < 6; m++)
                            for ( int n = 0; n < 7; n++)
                                yearModel[i * 6 + m][j * 7 + n] = monthModel[m][n];//将第i * 3 + j + 1个月的月份模型拷贝到年份模型的对应位置
                    }
                }
                printf("                             %s\n\n", [yearString UTF8String]);//输出年份数字
                for (int k = 0; k < 4; k++)//输出4行，每行3个月
                {
                    NSString *month1 = getMonthString(k * 3 + 1);
                    NSString *month2 = getMonthString(k * 3 + 2);
                    NSString *month3 = getMonthString(k * 3 + 3);
                    printf("        %s                  %s                  %s\n", [month1 UTF8String], [month2 UTF8String], [month3 UTF8String]);
                    printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六\n");
                    
                    for (int i = 0; i < 6; i++)
                    {
                        for (int j = 0; j < 21; j++)
                        {
                            if (yearModel[i + 6 * k][j] == 0) printf("   ");
                            else printf("%2ld ", yearModel[i + 6 * k][j]);
                            if (j % 7 == 6) printf(" ");
                        }
                        printf("\n");
                    }
                }
                break;
                
            }
            case 3://2个参数，打印该年该月
            {
                NSString *monthString = [NSString stringWithUTF8String:argv[1]];
                NSString *yearString = [NSString stringWithUTF8String:argv[2]];
                NSInteger month = [monthString integerValue];
                NSInteger year = [yearString integerValue];
                if (0 < month && month < 13 && year >0)
                {
                    printMonthOfYear(month, year);
                }
                else if (month <= 0 || month > 12)
                {
                    NSLog(@"%@ is not a month number(1..12)", monthString);
                }
                else if (year < 0)
                {
                    NSLog(@"%@ is not a valid year number", yearString);
                }
            }
				break;
            default:
                break;
        }
        //NSLog(@"Hello, World!");
    }
    return 0;
}
