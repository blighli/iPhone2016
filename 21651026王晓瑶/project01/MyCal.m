

#import "MyCal.h"

@implementation MyCal

+ (NSArray *)kNumArray {
    return @[@"", @"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九", @"十", @"十一", @"十二"];
}

+ (void)setKNumArray:(NSArray *)numArray {
    NSString *reason = @"you cannot set this property which only means to provide getter";
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil];
}

- (void)showCalendarWithYear:(NSUInteger)year minMonth:(NSUInteger)minMonth maxMonth:(NSUInteger)maxMonth andTimes:(NSUInteger)times {
    //年份的输出
    if (maxMonth - minMonth + 1 < times) {
        times = maxMonth - minMonth + 1;
    }
    NSUInteger spaceNum = times * 20 + (times-1) * 2;
    spaceNum = spaceNum/2 - 2;
    if (times >= 2) {
        for (int i = 0; i < spaceNum; i++) {
            printf(" ");
        }
        printf("%04lu\n\n", year);
    } else if (times == 1 && maxMonth - minMonth > 0) {
        printf("       %04lu\n\n", year);
    } else if (maxMonth == minMonth) {
        printf("     %s月 %04lu\n", [[MyCal kNumArray][minMonth] UTF8String], year);
    }

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compt = [[NSDateComponents alloc] init];

    NSMutableArray <NSNumber*> *firstDayOfMonth = [NSMutableArray arrayWithCapacity:13];
    NSMutableArray <NSNumber*> *totalDaysNumOfMonth = [NSMutableArray arrayWithCapacity:13];

    for (NSUInteger count = 0; count < 13; count++) {
        [firstDayOfMonth addObject:[NSNumber numberWithUnsignedInteger:0]];
        [totalDaysNumOfMonth addObject:[NSNumber numberWithUnsignedInteger:0]];
    }

    //获得[minMonth, maxMonth]之间的arrFirstDay和arrDayCount
    for (NSUInteger month = minMonth; month <= maxMonth; month++) {
        [compt setYear:year];
        [compt setMonth:month];
        [compt setDay:1];

        NSDate *date = [calendar dateFromComponents:compt];

        NSUInteger unFlag = (NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday);

        compt = [calendar components:unFlag fromDate:date];
        NSUInteger day = [compt day];
        NSUInteger week = [compt weekday];
        NSUInteger firstDay = week - day%7 + 1;

        NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
        NSUInteger totalDayNum = range.length;

        firstDayOfMonth[month] = [NSNumber numberWithUnsignedInteger:firstDay];
        totalDaysNumOfMonth[month] = [NSNumber numberWithUnsignedInteger:totalDayNum];

    }

    //日历输出
    NSMutableArray *outputArray = [NSMutableArray arrayWithCapacity:12];
    for (int i = 0; i < 12; i++) {
        [outputArray addObject:[NSNumber numberWithUnsignedInteger:0]];
    }
    for (NSUInteger month = minMonth; month <= maxMonth; month += times) {
        if (maxMonth - month + 1 < times) {
            times = maxMonth - month + 1;
        }
        if (minMonth != maxMonth) {
            for (int t = 0; t < times; t++) {
                if (month + t < 11) {
                    printf("        %s月          ", [[MyCal kNumArray][month+t] UTF8String]);
                } else {
                    printf("       %s月         ", [[MyCal kNumArray][month+t] UTF8String]);
                }
            }
            printf("\n");
        }
        for (int t = 0; t < times; t++) {
            printf("日  一 二 三  四 五 六 ");
            printf("  ");
        }
        printf("\n");
        for (int i = 0; i < times; i++) {
            outputArray[i] = [NSNumber numberWithUnsignedInteger:1];
        }
        for (int i = 0; i < 6; i++) {
            for (int t = 0; t < times; t++) {
                NSUInteger flag = 1;

                //处理第一行
                if (i == 0) {
                    for (NSUInteger j = 1; j < [firstDayOfMonth[month+t] unsignedIntegerValue]; j++) {
                        printf("   ");
                    }
                    flag = [firstDayOfMonth[month + t] unsignedIntegerValue];
                }
                for (NSUInteger j = flag; j <= 7; j++) {
                    if (j == 1 || [outputArray[t] unsignedIntegerValue] == 1) {
                        if ([outputArray[t] unsignedIntegerValue] > [totalDaysNumOfMonth[month+t] unsignedIntegerValue]) {
                            printf("  ");
                        } else {
                            NSUInteger oldValue = [outputArray[t] unsignedIntegerValue];
                            printf("%2lu", oldValue);
                            outputArray[t] = [NSNumber numberWithUnsignedInteger:oldValue+1];
                        }
                    } else {
                        if ([outputArray[t] unsignedIntegerValue] > [totalDaysNumOfMonth[month+t] unsignedIntegerValue]) {
                            printf("   ");
                        } else {
                            NSUInteger oldValue = [outputArray[t] unsignedIntegerValue];
                            printf("%3lu", oldValue);
                            outputArray[t] = [NSNumber numberWithUnsignedInteger:oldValue+1];
                        }
                    }

                    if (j == 7) {
                        if (t == times - 1) {
                            printf("\n");
                        } else {
                            printf("  ");
                        }
                    }
                }
            }
        }
    }
}

- (bool)isLegal:(const char *)str {
    for (int i = 0; i < strlen(str); i++)
        if (str[i] < '0' || str[i] > '9')
            return false;
    return true;
}

- (bool)isMonth:(NSUInteger)month {
    return month >= 1 && month <= 12;
}

@end
