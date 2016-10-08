//
//  print.m
//  test
//
//  Created by sally on 16/10/7.
//  Copyright © 2016年 sally. All rights reserved.
//

#import "print.h"
#import "Days.h"

@implementation Print

- (void) printMonth:(int)year month:(int)month {
    NSNumber * none = [[NSNumber alloc] initWithInt:0];
    NSNumber * jan = [[NSNumber alloc] initWithInt:31];
    NSNumber * febLeap = [[NSNumber alloc] initWithInt:29];
    NSNumber * febNotLeap = [[NSNumber alloc] initWithInt:28];
    NSNumber * mar = [[NSNumber alloc] initWithInt:31];
    NSNumber * apr = [[NSNumber alloc] initWithInt:30];
    NSNumber * may = [[NSNumber alloc] initWithInt:31];
    NSNumber * jun = [[NSNumber alloc] initWithInt:30];
    NSNumber * jul = [[NSNumber alloc] initWithInt:31];
    NSNumber * aug = [[NSNumber alloc] initWithInt:31];
    NSNumber * sep = [[NSNumber alloc] initWithInt:30];
    NSNumber * oct = [[NSNumber alloc] initWithInt:31];
    NSNumber * nov = [[NSNumber alloc] initWithInt:30];
    NSNumber * dec = [[NSNumber alloc] initWithInt:31];
    
    NSMutableArray * monthArray = [[NSMutableArray alloc] init];
    
    if ([Days isLeap:year]) {
        NSArray * arr = [[NSArray alloc] initWithObjects:none,jan,febLeap,mar,apr,may,jun,jul,aug,sep,oct,nov,dec, nil];
        [monthArray addObjectsFromArray:arr];
    } else {
        NSArray * arr = [[NSArray alloc] initWithObjects:none,jan,febNotLeap,mar,apr,may,jun,jul,aug,sep,oct,nov,dec, nil];
        [monthArray addObjectsFromArray:arr];
    }
    
    NSString * calendarStr = [[NSString alloc] initWithFormat:@"%@", @" Su Mo Tu We Th Fr Sa"];
    NSMutableString * yearStr = [[NSMutableString alloc] initWithFormat:@"%d", year];
    NSMutableString * monthStr = [Print transformMonthToEnglish:month];
    [monthStr appendString:@" "];
    [monthStr appendString:yearStr];
    
    int titleLen = (int)yearStr.length;
    int calendarLen = (int)calendarStr.length;
    int blankLen = (calendarLen - titleLen) / 2;
    for (int i = 0; i < blankLen - 3; i ++) {
        printf(" ");
    }
    printf("%s\n", [monthStr UTF8String]);
    printf(" Su Mo Tu We Th Fr Sa");
    printf("\n");
    
    int position = [Print positionCal:year month:month];
    if (position != 0) {
        for (int i = 0; i < position; i ++) {
            printf("   ");
        }
    }
    
    //first line
    int index = 0;
    for (; index < (7 - position);) {
        printf(" %2d", ++ index);
    }
    printf("\n");
    
    //second line
    int count = 0;
    for (; index < [[monthArray objectAtIndex:month] intValue];) {
        printf(" %2d", ++ index);
        count ++;
        if (count % 7 == 0) {
            printf("\n");
        }
    }
    printf("\n");
}

+ (NSMutableString *) transformMonthToEnglish : (int)month {
    switch (month) {
        case 1:
            return [[NSMutableString alloc] initWithFormat:@"January "];
            break;
        case 2:
            return [[NSMutableString alloc] initWithFormat:@"Februay "];
            break;
        case 3:
            return [[NSMutableString alloc] initWithFormat:@"March   "];
            break;
        case 4:
            return [[NSMutableString alloc] initWithFormat:@"April   "];
            break;
        case 5:
            return [[NSMutableString alloc] initWithFormat:@"May     "];
            break;
        case 6:
            return [[NSMutableString alloc] initWithFormat:@"June    "];
            break;
        case 7:
            return [[NSMutableString alloc] initWithFormat:@"July    "];
            break;
        case 8:
            return [[NSMutableString alloc] initWithFormat:@"August  "];
            break;
        case 9:
            return [[NSMutableString alloc] initWithFormat:@"September"];
            break;
        case 10:
            return [[NSMutableString alloc] initWithFormat:@"October "];
            break;
        case 11:
            return [[NSMutableString alloc] initWithFormat:@"November"];
            break;
        case 12:
            return [[NSMutableString alloc] initWithFormat:@"December"];
            break;
            
        default:
            break;
    }
    return [[NSMutableString alloc] initWithFormat:@""];
}

+ (int) positionCal : (int)year month : (int)month {
    int day = [Days daysUntilLastMonth:year month:month];
    
    //calculate position
    int position = day % 7;//1970/1/1 4 Thu
    if (position <= 2) {
        position += 4;
    } else {
        position -= 3;
    }
    
    return position;
}

+ (void) firstLine : (int)year month : (int)month index : (int *)index {
    int position = [Print positionCal:year month:month];
    //    printf("%d", position);
    if (position != 0) {
        for (int i = 0; i < position; i ++) {
            printf("   ");
        }
    }
    
    index[month] = 0;
    for (; index[month] < (7 - position);) {
        printf(" %2d", ++ index[month]);
    }
}

+ (void) printThreeMonths : (int)year beginMonth : (int)beginMonth {
    NSMutableString * m1 = [Print transformMonthToEnglish:beginMonth];
    NSMutableString * m2 = [Print transformMonthToEnglish:(beginMonth + 1)];
    NSMutableString * m3 = [Print transformMonthToEnglish:(beginMonth + 2)];
    NSMutableString * mm = [[NSMutableString alloc] initWithFormat:@"       %@              %@              %@", m1, m2, m3];
    printf("%s", [mm UTF8String]);
    printf("\n");
    printf(" Su Mo Tu We Th Fr Sa ");
    printf(" Su Mo Tu We Th Fr Sa ");
    printf(" Su Mo Tu We Th Fr Sa ");
    printf("\n");
    
    int index[13] = {0,0,0,0,0,0,0,0,0,0,0,0,0};
    int monthTotal[] = {0, 31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    monthTotal[2] = [Days isLeap:year] ? 29 : 28;
    
    for (int i = beginMonth; i < beginMonth + 3; i ++) {
        [Print firstLine:year month:i index:index];
        printf(" ");
    }
    printf("\n");
    
    BOOL flag[] = {true, true, true};
    
    while (flag[0] || flag[1] || flag[2]) {
        int thisMonth = beginMonth;
        for (int j = 0; j < 3; j ++, thisMonth ++) {
            for (int i = 0; i < 7; i ++) {
                if (index[thisMonth] >= monthTotal[thisMonth]) {
                    printf("   ");
                    flag[j] = false;
                } else {
                    printf(" %2d", ++ index[thisMonth]);
                }
            }
            (j == 2) ? printf("\n") : printf(" ");
        }
    }
    printf("\n");
}

- (void) printYear:(int)year {
    printf("                             %d\n\n", year);
    [Print printThreeMonths:year beginMonth:1];
    [Print printThreeMonths:year beginMonth:4];
    [Print printThreeMonths:year beginMonth:7];
    [Print printThreeMonths:year beginMonth:10];
    
}

@end

