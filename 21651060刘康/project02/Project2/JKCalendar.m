//
//  JKCalendar.m
//  Project2
//
//  Created by Newcon on 2016/10/24.
//  Copyright © 2016年 Edward Lin. All rights reserved.
//

#import "JKCalendar.h"

@implementation JKCalendar

- (instancetype)init
{
    if (self = [super init]) {
        _weekTitle = @"日 一 二 三 四 五 六";
        _monthTitleInYearArray = @[@"        一月                  二月                  三月",
                                                 @"        四月                  五月                  六月",
                                                 @"        七月                  八月                  九月",
                                                 @"        十月                 十一月                十二月"];
        _weekTitleInYear = @"日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六";
        _monthTitleArray = @[@" 一月", @" 二月", @" 三月", @" 四月", @" 五月", @" 六月", @" 七月", @" 八月", @" 九月", @" 十月", @"十一月", @"十二月"];
    }
    return self;
}

- (NSArray *)getArrayOfCalendarWithFirstDayOfMonth:(NSDate *) firstDayOfMonth {
    NSMutableArray<NSString *> *output = [NSMutableArray array];
    
    NSDateComponents *firstDayOfMonthComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitWeekday fromDate:firstDayOfMonth];
    [output addObject:[NSString stringWithFormat:@"%@ %ld", [_monthTitleArray objectAtIndex:([firstDayOfMonthComponents month] - 1)], (long)[firstDayOfMonthComponents year]]];
    
    NSArray *weekTitle = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    [output addObjectsFromArray:weekTitle];
    
    NSMutableArray *currentMonthArray = [NSMutableArray arrayWithCapacity:31];
    for (int i = 0; i < [firstDayOfMonthComponents weekday] - 1; ++i) {                     //每月第一天之前用空格补充
        [currentMonthArray addObject:@"  "];
    }
    for (int i = 0; i < [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDayOfMonth].length; ++i) {
        [currentMonthArray addObject:[NSString stringWithFormat:@"%2i", i + 1]];
    }
    [output addObjectsFromArray:currentMonthArray];
    
    for (NSInteger i = output.count; i <= 49; ++i) {
        [output addObject:@"  "];
    }
    
    return output;
}

- (NSString *)printMonthCalendarWithFirstDayOfMonth:(NSDate *) firstDayOfMonth {
    NSMutableString *output = [NSMutableString string];
    
    NSDateComponents *firstDayOfMonthComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitWeekday fromDate:firstDayOfMonth];
    [output appendFormat:@"\n    %@ %ld\n", [_monthTitleArray objectAtIndex:([firstDayOfMonthComponents month] - 1)], (long)[firstDayOfMonthComponents year]];
    [output appendFormat:@"%@\n", _weekTitle];
    
    NSMutableArray *currentMonthArray = [NSMutableArray arrayWithCapacity:31];
    for (int i = 0; i < [firstDayOfMonthComponents weekday] - 1; ++i) {                     //每月第一天之前用空格补充
        [currentMonthArray addObject:@"  "];
    }
    for (int i = 0; i < [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDayOfMonth].length; ++i) {
        [currentMonthArray addObject:[NSString stringWithFormat:@"%2i", i + 1]];
    }
    NSMutableString *outputLine = [NSMutableString string];             //七天一换行
    for (int i = 0; i < [currentMonthArray count]; ++i) {
        [outputLine appendFormat:@"%@ ", [currentMonthArray objectAtIndex:i]];
        if (i % 7 == 6) {
            [output appendFormat:@"%@\n", [outputLine substringToIndex:([outputLine length] - 1)]];
            outputLine = [NSMutableString string];
        }
    }
    if (![outputLine isEqualToString:@""]) {                //最后一周可能没有七天
        [output appendFormat:@"%@\n", [outputLine substringToIndex:([outputLine length] - 1)]];
    }
//    NSLog(@"%@", output);
    return output;
}

- (NSString *)printYearCalendarWithYear:(int) year {
    NSMutableString *output = [NSMutableString string];
    
    [output appendFormat:@"\n                             %i\n\n", year];
    
    NSMutableArray<NSMutableArray *> *monthArrays = [NSMutableArray arrayWithCapacity:12];
    
    for (int i = 0; i < 12; ++i) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];       // 年-月-日 时:分:秒
        NSString *dateStr = [NSString stringWithFormat:@"%i-%i-01 12:00:00", year, i + 1];          //自定义每个月的第一天
        NSDate *firstDayOfMonth = [formatter dateFromString:dateStr];
        NSDateComponents *firstDayOfMonthComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitWeekday fromDate:firstDayOfMonth];
        
        NSMutableArray *theMonthArray = [NSMutableArray array];             //初始化这个月，并存为Array，每个月都按六周算，前后用空格补充
        for (int j = 0; j < [firstDayOfMonthComponents weekday] - 1; ++j) {
            [theMonthArray addObject:@"  "];
        }
        for (int j = 0; j < [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDayOfMonth].length; ++j) {
            [theMonthArray addObject:[NSString stringWithFormat:@"%2i", j + 1]];
        }
        if ((i + 1) % 3 != 0) {
            for (int j = (int)[theMonthArray count]; j < 42; ++j) {
                [theMonthArray addObject:@"  "];
            }
        }
        
        [monthArrays addObject:[NSMutableArray arrayWithArray:[theMonthArray copy]]];
    }
    
    for (int i = 0; i < 4; ++i) {
        [output appendFormat:@"%@\n%@\n", _monthTitleInYearArray[i], _weekTitleInYear];
        
        for (int line = 0; line < 6; ++line) {                  //每个月都是输出六行，每行都是输出第i周的三个月的日期
            NSString *outputLine = [NSString string];           //outputLine保存每行的输出字符串
            for (int j = 0; j < 3; ++j) {                       //每行三个月
                NSMutableArray *theMonthArray = [NSMutableArray arrayWithArray:[monthArrays objectAtIndex:i * 3 + j]];
                for (int k = line * 7; k < [theMonthArray count]; ++k) {        //每七天后接下个月第i周的日期
                    outputLine = [outputLine  stringByAppendingString:[NSString stringWithFormat:@"%@ ", [theMonthArray objectAtIndex:k]]];
                    if (k % 7 == 6 ) {
                        if ((j + 1) % 3 != 0) {
                            outputLine = [outputLine stringByAppendingString:@" "];
                        }
                        break;
                    }
                }
            }
            if ([outputLine length] > 46) {             //当这行完成以后，保存进最终的输出字符串output
                [output appendFormat:@"%@\n", [outputLine substringToIndex:([outputLine length] - 1)]];
            } else {
                [output appendFormat:@"%@\n", outputLine];
            }
        }
    }
//    NSLog(@"%@", output);
    return output;
}

@end
