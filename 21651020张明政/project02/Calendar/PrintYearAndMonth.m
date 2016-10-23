//
//  PrintYearAndMonth.m
//  project01
//
//  Created by Benjamin on 16/10/3.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "PrintYearAndMonth.h"
#import "Days.h"

@implementation PrintYearAndMonth
//输出一个月的日历
-(void)printmonth:(int)year yue:(int)yue{
    NSNumber *none = [[NSNumber alloc] initWithInt:0];
    NSNumber *jan = [[NSNumber alloc] initWithInt:31];
    NSNumber *febLeap = [[NSNumber alloc] initWithInt:29];
    NSNumber *febNotLeap = [[NSNumber alloc] initWithInt:28];
    NSNumber *mar = [[NSNumber alloc] initWithInt:31];
    NSNumber *apr = [[NSNumber alloc] initWithInt:30];
    NSNumber *may = [[NSNumber alloc] initWithInt:31];
    NSNumber *jun = [[NSNumber alloc] initWithInt:30];
    NSNumber *jul = [[NSNumber alloc] initWithInt:31];
    NSNumber *aug = [[NSNumber alloc] initWithInt:31];
    NSNumber *sep = [[NSNumber alloc] initWithInt:30];
    NSNumber *oco = [[NSNumber alloc] initWithInt:31];
    NSNumber *nov = [[NSNumber alloc] initWithInt:30];
    NSNumber *dec = [[NSNumber alloc] initWithInt:31];
    
    NSMutableArray * monthArray=[[NSMutableArray alloc]init];
    
    if ([Days isLeapYear:year]) {
        NSArray * arr = [[NSArray alloc]initWithObjects:none,jan,febLeap,mar,apr,may,jun,jul,aug,sep,oco,nov,dec, nil];
        
        [monthArray addObjectsFromArray:arr];
    }else{
        NSArray * arr = [[NSArray alloc]initWithObjects:none,jan,febNotLeap,mar,apr,may,jun,jul,aug,sep,oco,nov,dec, nil];
        
        [monthArray addObjectsFromArray:arr];
    }
    
    int day=0;
    
    //计算一个月份日历的长度
    NSString * calendarStr = [[NSString alloc]initWithFormat:@"%@",@"日 一 二 三 四 五 六"];
    
    //年份转化为字符串
    NSMutableString * yearStr = [[NSMutableString alloc]initWithFormat:@"%d",year];
    NSMutableString * monthStr =[PrintYearAndMonth transformMonthToChinese:yue];
    [monthStr appendString:@" "];
    [monthStr appendString:yearStr];
    
    //计算标题的长度
    //不同
    int titleLen = (int)yearStr.length;
    
//    NSLog(@"%d",(int)yearStr.length);
//    printf("\n");
//    NSLog(@"%d",(int)monthStr.length);
//    printf("\n");
//    NSLog(@"%d",(int)calendarStr.length);
    
    //计算一个月日历的长度
    int calendarLen=(int)calendarStr.length;
    
    //计算左侧需要空出的空格
    //不同
    int blankLen = (calendarLen - titleLen) / 2 + 1;
    
    for (int i = 0; i < blankLen; i++) {
        printf(" ");
    }
    
    printf("%s\n",[monthStr UTF8String]);
    printf("日 一 二 三 四 五 六\n");
    
    day=[Days daysOfUntilLastMonth:year yue:yue];
    
//    NSLog(@"%d",day);
    
    //不同
    int position = day % 7 + 1;
    
    if (position == 7) {
        
    }else{
        for (int i = 0; i < position; i++) {
            printf("   ");
        }
    }
    
    //输出第一行
    int i;
    for (i = 0; i < (6 - position) + 1; ) {
        printf("%2d ",++i);
    }
    
    if (position == 7) {
        
    }else{
        printf("\n");
    }
    
    //输出第二行开始所有的
    int count = 0;
    
    for (; i < [[monthArray objectAtIndex:yue]intValue]; ) {
        printf("%2d ",++i);
        count++;
        if (count == 7) {
            printf("\n");
            count = 0;
        }
    }
    
    //月份输出完毕，换行结束
    printf("\n");
}//printmonth()

+ (NSMutableString *) transformMonthToChinese:(int)month{
    switch (month) {
        case  1:
            return [[NSMutableString alloc] initWithFormat:@"一月"];
            break;
        case  2:
            return [[NSMutableString alloc] initWithFormat:@"二月"];
            break;
        case  3:
            return [[NSMutableString alloc] initWithFormat:@"三月"];
            break;
        case  4:
            return [[NSMutableString alloc] initWithFormat:@"四月"];
            break;
        case  5:
            return [[NSMutableString alloc] initWithFormat:@"五月"];
            break;
        case  6:
            return [[NSMutableString alloc] initWithFormat:@"六月"];
            break;
        case  7:
            return [[NSMutableString alloc] initWithFormat:@"七月"];
            break;
        case  8:
            return [[NSMutableString alloc] initWithFormat:@"八月"];
            break;
        case  9:
            return [[NSMutableString alloc] initWithFormat:@"九月"];
            break;
        case  10:
            return [[NSMutableString alloc] initWithFormat:@"十月"];
            break;
        case  11:
            return [[NSMutableString alloc] initWithFormat:@"十一月"];
            break;
        case  12:
            return [[NSMutableString alloc] initWithFormat:@"十二月"];
            break;
        default:
            break;
    }
    
    return [[NSMutableString alloc]initWithFormat:@""];
}

//输出一年的日历
-(void)printyear:(int)year{
    //首先居中打出年份
    printf("                             %d\n\n",year);
    
    //总共四组，首先实现第一组
    printf("        一月                  二月                  三月\n");
    printf("日 一 二 三 四 五 六 ");
    printf(" 日 一 二 三 四 五 六 ");
    printf(" 日 一 二 三 四 五 六");
    printf("\n");
    
    //开始打印一月的第一行
    int day1 = 0;
    
    //上一年距离第一年第一天的天数
    day1 = [Days daysOfUntilLastMonth:year yue:1];
    
    int position1 = day1 % 7 + 1;
    if (position1 == 7) {
        
    }else{
        for (int i = 0; i < position1; i++) {
            printf("   ");
        }
    }
    int i1;
    if (position1 == 7) {
        for (i1 = 0; i1 < 7; ) {
            printf("%2d ",++i1);
        }
    }else{
        for (i1 = 0; i1 < (6 - position1) + 1; ) {
            printf("%2d ",++i1);
        }
    }
    
    //开始打印二月的第一行
    int day2 = 0;
    day2 = [Days daysOfUntilLastMonth:year yue:2];
    int position2 = day2 % 7 + 1;
    printf(" ");
    if (position2 == 7) {
        
    }else{
        for (int i = 0; i<position2; i++) {
            printf("   ");
        }
    }
    int i2;
    if (position2 == 7) {
        for (i2 = 0; i2 < 7; ) {
            printf("%2d ",++i2);
        }
    }else{
        for (i2 = 0; i2 < (6-position2) + 1; ) {
            printf("%2d ",++i2);
        }
    }
    
    //开始打印三月的第一行
    int day3 = 0;
    day3 = [Days daysOfUntilLastMonth:year yue:3];
    int position3 = day3 % 7 + 1;
    printf(" ");
    if (position3 == 7) {
        
    }else{
        for (int i = 0; i<position3; i++) {
            printf("   ");
        }
    }
    int i3;
    if (position3 == 7) {
        for (i3 = 0; i3 < 7; ) {
            printf("%2d ",++i3);
        }
    }else{
        for (i3 = 0; i3 < (6-position3) + 1; ) {
            printf("%2d ",++i3);
        }
    }
    
    printf("\n");
    
    int count1 = 0;
    int count2 = 0;
    int count3 = 0;
    BOOL flag1 = true;
    BOOL flag2 = true;
    BOOL flag3 = true;
    
    while (flag1 || flag2 || flag3) {
        //开始打印一月的第二行
        for (; true; ) {
            if (i1 >= 31) {
                printf("   ");   //1月全部打印完毕，输出空格
                flag1 = false;
            }else{
                printf("%2d ",++i1);
            }
            count1++;
            if (count1 == 7) {
                count1 = 0;
                //打印二月的第二行
                printf(" ");
                for (; true; ) {
                    if (i2 >= ([Days isLeapYear:year] == true ? 29 : 28)) {
                        printf("   ");    //2月全部打印完毕，输出空格
                        flag2 = false;
                    }else{
                        printf("%2d ",++i2);
                    }
                    count2++;
                    if (count2 == 7) {
                        count2 = 0;
                        //打印三月的第二行
                        printf(" ");
                        for (; true; ) {
                            if (i3 >= 31) {
                                flag3 = false;
                            }else{
                                printf("%2d ",++i3);
                            }
                            count3++;
                            if (count3 == 7) {
                                count3 = 0;
                                printf("\n");
                                break;
                            }//if
                        }//for
                        break;
                    }//if
                }//for
                break;
            }//if
        }//for
    }//while
    
    
    //总共四组，实现第二组
    printf("        四月                  五月                  六月\n");
    printf("日 一 二 三 四 五 六 ");
    printf(" 日 一 二 三 四 五 六 ");
    printf(" 日 一 二 三 四 五 六");
    printf("\n");
    
    //开始打印四月的第一行
    int day4 = 0;
    
    //距离第一年四月第一天的天数
    day4 = [Days daysOfUntilLastMonth:year yue:4];
    
    int position4 = day4 % 7 + 1;
    if (position4 == 7) {
        
    }else{
        for (int i = 0; i < position4; i++) {
            printf("   ");
        }
    }
    int i4;
    if (position4 == 7) {
        for (i4 = 0; i4 < 7; ) {
            printf("%2d ",++i4);
        }
    }else{
        for (i4 = 0; i4 < (6 - position4) + 1; ) {
            printf("%2d ",++i4);
        }
    }
    
    //开始打印五月的第一行
    int day5 = 0;
    day5 = [Days daysOfUntilLastMonth:year yue:5];
    int position5 = day5 % 7 + 1;
    printf(" ");
    if (position5 == 7) {
        
    }else{
        for (int i = 0; i<position5; i++) {
            printf("   ");
        }
    }
    int i5;
    if (position5 == 7) {
        for (i5 = 0; i5 < 7; ) {
            printf("%2d ",++i5);
        }
    }else{
        for (i5 = 0; i5 < (6-position5) + 1; ) {
            printf("%2d ",++i5);
        }
    }
    
    //开始打印六月的第一行
    int day6 = 0;
    day6 = [Days daysOfUntilLastMonth:year yue:6];
    int position6 = day6 % 7 + 1;
    printf(" ");
    if (position6 == 7) {
        
    }else{
        for (int i = 0; i<position6; i++) {
            printf("   ");
        }
    }
    int i6;
    if (position6 == 7) {
        for (i6 = 0; i6 < 7; ) {
            printf("%2d ",++i6);
        }
    }else{
        for (i6 = 0; i6 < (6-position6) + 1; ) {
            printf("%2d ",++i6);
        }
    }
    
    printf("\n");
    
    
    int count4 = 0;
    int count5 = 0;
    int count6 = 0;
    BOOL flag4 = true;
    BOOL flag5 = true;
    BOOL flag6 = true;
    
    while (flag4 || flag5 || flag6) {
        //开始打印四月的第二行
        for (; true; ) {
            if (i4 >= 30) {
                printf("   ");   //4月全部打印完毕，输出空格
                flag4 = false;
            }else{
                printf("%2d ",++i4);
            }
            count4++;
            if (count4 == 7) {
                count4 = 0;
                //打印五月的第二行
                printf(" ");
                for (; true; ) {
                    if (i5 >= 31) {
                        printf("   ");    //5月全部打印完毕，输出空格
                        flag5 = false;
                    }else{
                        printf("%2d ",++i5);
                    }
                    count5++;
                    if (count5 == 7) {
                        count5 = 0;
                        //打印六月的第二行
                        printf(" ");
                        for (; true; ) {
                            if (i6 >= 30) {
                                flag6 = false;
                            }else{
                                printf("%2d ",++i6);
                            }
                            count6++;
                            if (count6 == 7) {
                                count6 = 0;
                                printf("\n");
                                break;
                            }//if
                        }//for
                        break;
                    }//if
                }//for
                break;
            }//if
        }//for
    }//while

    
    //总共四组，实现第三组
    printf("        七月                  八月                  九月\n");
    printf("日 一 二 三 四 五 六 ");
    printf(" 日 一 二 三 四 五 六 ");
    printf(" 日 一 二 三 四 五 六");
    printf("\n");
    
    //开始打印七月的第一行
    int day7 = 0;
    
    //距离第一年七月第一天的天数
    day7 = [Days daysOfUntilLastMonth:year yue:7];
    
    int position7 = day7 % 7 + 1;
    if (position7 == 7) {
        
    }else{
        for (int i = 0; i < position7; i++) {
            printf("   ");
        }
    }
    int i7;
    if (position7 == 7) {
        for (i7 = 0; i7 < 7; ) {
            printf("%2d ",++i7);
        }
    }else{
        for (i7 = 0; i7 < (6 - position7) + 1; ) {
            printf("%2d ",++i7);
        }
    }
    
    //开始打印八月的第一行
    int day8 = 0;
    day8 = [Days daysOfUntilLastMonth:year yue:8];
    int position8 = day8 % 7 + 1;
    printf(" ");
    if (position8 == 7) {
        
    }else{
        for (int i = 0; i<position8; i++) {
            printf("   ");
        }
    }
    int i8;
    if (position8 == 7) {
        for (i8 = 0; i8 < 7; ) {
            printf("%2d ",++i8);
        }
    }else{
        for (i8 = 0; i8 < (6-position8) + 1; ) {
            printf("%2d ",++i8);
        }
    }
    
    //开始打印九月的第一行
    int day9 = 0;
    day9 = [Days daysOfUntilLastMonth:year yue:9];
    int position9 = day9 % 7 + 1;
    printf(" ");
    if (position9 == 7) {
        
    }else{
        for (int i = 0; i<position9; i++) {
            printf("   ");
        }
    }
    int i9;
    if (position9 == 7) {
        for (i9 = 0; i9 < 7; ) {
            printf("%2d ",++i9);
        }
    }else{
        for (i9 = 0; i9 < (6-position9) + 1; ) {
            printf("%2d ",++i9);
        }
    }
    
    printf("\n");
    
    int count7 = 0;
    int count8 = 0;
    int count9 = 0;
    BOOL flag7 = true;
    BOOL flag8 = true;
    BOOL flag9 = true;
    
    while (flag7 || flag8 || flag9) {
        //开始打印七月的第二行
        for (; true; ) {
            if (i7 >= 31) {
                printf("   ");   //7月全部打印完毕，输出空格
                flag7 = false;
            }else{
                printf("%2d ",++i7);
            }
            count7++;
            if (count7 == 7) {
                count7 = 0;
                //打印八月的第二行
                printf(" ");
                for (; true; ) {
                    if (i8 >= 31) {
                        printf("   ");    //8月全部打印完毕，输出空格
                        flag8 = false;
                    }else{
                        printf("%2d ",++i8);
                    }
                    count8++;
                    if (count8 == 7) {
                        count8 = 0;
                        //打印九月的第二行
                        printf(" ");
                        for (; true; ) {
                            if (i9 >= 30) {
                                flag9 = false;
                            }else{
                                printf("%2d ",++i9);
                            }
                            count9++;
                            if (count9 == 7) {
                                count9 = 0;
                                printf("\n");
                                break;
                            }//if
                        }//for
                        break;
                    }//if
                }//for
                break;
            }//if
        }//for
    }//while
    
    
    //总共四组，实现第四组
    printf("        十月                 十一月                十二月\n");
    printf("日 一 二 三 四 五 六 ");
    printf(" 日 一 二 三 四 五 六 ");
    printf(" 日 一 二 三 四 五 六");
    printf("\n");
    
    //开始打印十月的第一行
    int day10 = 0;
    
    //距离第一年十月第一天的天数
    day10 = [Days daysOfUntilLastMonth:year yue:10];
    
    int position10 = day10 % 7 + 1;
    if (position10 == 7) {
        
    }else{
        for (int i = 0; i < position10; i++) {
            printf("   ");
        }
    }
    int i10;
    if (position10 == 7) {
        for (i10 = 0; i10 < 7; ) {
            printf("%2d ",++i10);
        }
    }else{
        for (i10 = 0; i10 < (6 - position10) + 1; ) {
            printf("%2d ",++i10);
        }
    }
    
    //开始打印十一月的第一行
    int day11 = 0;
    day11 = [Days daysOfUntilLastMonth:year yue:11];
    int position11 = day11 % 7 + 1;
    printf(" ");
    if (position11 == 7) {
        
    }else{
        for (int i = 0; i<position11; i++) {
            printf("   ");
        }
    }
    int i11;
    if (position11 == 7) {
        for (i11 = 0; i11 < 7; ) {
            printf("%2d ",++i11);
        }
    }else{
        for (i11 = 0; i11 < (6-position11) + 1; ) {
            printf("%2d ",++i11);
        }
    }
    
    //开始打印十二月的第一行
    int day12 = 0;
    day12 = [Days daysOfUntilLastMonth:year yue:12];
    int position12 = day12 % 7 + 1;
    printf(" ");
    if (position12 == 7) {
        
    }else{
        for (int i = 0; i<position12; i++) {
            printf("   ");
        }
    }
    int i12;
    if (position12 == 7) {
        for (i12 = 0; i12 < 7; ) {
            printf("%2d ",++i12);
        }
    }else{
        for (i12 = 0; i12 < (6-position12) + 1; ) {
            printf("%2d ",++i12);
        }
    }
    
    printf("\n");

    int count10 = 0;
    int count11 = 0;
    int count12 = 0;
    BOOL flag10 = true;
    BOOL flag11 = true;
    BOOL flag12 = true;
    
    while (flag10 || flag11 || flag12) {
        //开始打印十月的第二行
        for (; true; ) {
            if (i10 >= 31) {
                printf("   ");   //10月全部打印完毕，输出空格
                flag10 = false;
            }else{
                printf("%2d ",++i10);
            }
            count10++;
            if (count10 == 7) {
                count10 = 0;
                //打印十一月的第二行
                printf(" ");
                for (; true; ) {
                    if (i11 >= 30) {
                        printf("   ");    //11月全部打印完毕，输出空格
                        flag11 = false;
                    }else{
                        printf("%2d ",++i11);
                    }
                    count11++;
                    if (count11 == 7) {
                        count11 = 0;
                        //打印十二月的第二行
                        printf(" ");
                        for (; true; ) {
                            if (i12 >= 31) {
                                flag12 = false;
                            }else{
                                printf("%2d ",++i12);
                            }
                            count12++;
                            if (count12 == 7) {
                                count12 = 0;
                                printf("\n");
                                break;
                            }//if
                        }//for
                        break;
                    }//if
                }//for
                break;
            }//if
        }//for
    }//while

    printf("\n");
    
}
@end
