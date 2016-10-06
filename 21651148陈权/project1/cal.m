
#include "cal.h"
#include <Foundation/Foundation.h>

@implementation MonthFormatter
 @synthesize  firstDayWeekDay,maxRangeOfMonth,monthIndator,yearIndator;
+ (MonthFormatter *)initByMonth:(int)m AndYear:(int)y {
  MonthFormatter *mf = [[MonthFormatter alloc] init];

  NSCalendar *calendar = [NSCalendar currentCalendar];
  //通过指定年月获取日期

  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // 年-月-日 时:分:秒
  NSString *dateStr = [NSString
      stringWithFormat:@"%i-%i-01 12:00:00", y, m]; //自定义每个月的第一天
  NSDate *firstDayOfMonth = [formatter dateFromString:dateStr];
  NSDateComponents *firstDayOfMonthComponents =
      [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth |
                           NSCalendarUnitYear | NSCalendarUnitWeekday
                  fromDate:firstDayOfMonth];

  int dayRange = [self judgeRangeByMonth:m AndYear:y];

  //当前月的第一天 周日是1 周六是7
  [mf setFirstDayWeekDay:[firstDayOfMonthComponents weekday] ];

  [mf setMaxRangeOfMonth:dayRange];

  [mf setMonthIndator:m];

  [mf setYearIndator:y];

  // [dateComponents release];
  [mf retain];
  return mf;
}

+ (int)judgeRangeByMonth:(int)mon AndYear:(int)year {
  int yearRange[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
  if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))
    yearRange[1] = 29;
  else
    yearRange[1] = 28;

  return yearRange[mon - 1];
}

- (NSMutableArray *)getArray {
  int i, j;
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:42];
  for (i = 0; i < 42; ++i) {
    [array addObject:@"  "];
  }
  for (j = self.firstDayWeekDay;
       j < self.maxRangeOfMonth + self.firstDayWeekDay; ++j) {
    [array setObject:[NSString stringWithFormat:@"%2i",
                                                (j - (int)firstDayWeekDay + 1)]
        atIndexedSubscript:j];
  }
  return array;
}
- (void)print {
  NSArray *MonthArray = [NSArray
      arrayWithObjects:@"一月", @"二月", @"三月", @"四月", @"五月",
                       @"六月", @"七月", @"八月", @"九月", @"十月",
                       @"十一月", @"十二月", nil];

  NSMutableString *s = [NSMutableString
      stringWithFormat:@"     %@ %-9i\n日 一 二 三 四 五 六",
                       (NSString *)[MonthArray
                           objectAtIndex:self.monthIndator - 1],
                       self.yearIndator, self.maxRangeOfMonth];
  NSMutableArray *dataArray = [self getArray];
  // NSLog(@"%@",dataArray);
  int i;
  for (i = 0; i < 42; i++) {
    id value = [dataArray objectAtIndex:i];
    NSMutableString *str = [NSMutableString stringWithString:(NSString *)value];
    [s appendString:str];
    if (i % 7 == 0) {
      [s appendString:@"\n"];
    } else {
      [s appendString:@" "];
    }
  }
  NSLog(s);
}

// getter and setter
/*
- (void)setFirstDayWeekDay:(NSUInteger)firstDay {
  firstDayWeekDay = firstDay;
}
- (NSUInteger)firstDayWeekDay {
  return firstDayWeekDay;
}
- (void)setMaxRangeOfMonth:(NSUInteger)MaxMon {
  maxRangeOfMonth = MaxMon;
}
- (NSUInteger)maxRangeOfMonth {
  return maxRangeOfMonth;
}
- (void)setMonthIndator:(int)monInd {
  monthIndator = monInd;
}
- (int)monthIndator {
  return monthIndator;
}
- (void)setYearIndator:(int)yearInd {
  yearIndator = yearInd;
}
- (int)yearIndator {
  return yearIndator;
}
*/
@end

@implementation YearFormatter
@synthesize yearIndator;
+ (YearFormatter *) initWithYear:(int)y{
    YearFormatter  * yf = [[YearFormatter alloc] init];
    [yf setYearIndator:y];
    return yf;
}
- (void)print{
    int i,j;
    NSMutableArray *yearArray = [NSMutableArray array];
    for ( i = 1 ;i <=12;i++){
        MonthFormatter *mf = [MonthFormatter initByMonth: i AndYear: self.yearIndator];
        NSMutableArray *mouthArray = [mf getArray];
        [mouthArray removeObjectAtIndex:0];
        [mouthArray addObject:@"  "];
        [yearArray addObject:mouthArray];
        // [mf print];
    }
    NSLog(@"%35i                               \n",self.yearIndator);
    NSString *mon1  = @"        一月                   二月                   三月        \n";
    NSString *mon2  = @"        四月                   五月                   六月        \n";
    NSString *mon3  = @"        七月                   八月                   九月        \n";
    NSString *mon4  = @"        十月                  十一月                 十二月       \n";
    NSString *wkstr = @"日 一 二 三 四 五 六   日 一 二 三 四 五 六   日 一 二 三 四 五 六\n";

   NSMutableString *ms= [NSMutableString stringWithString:mon1];
   [ms appendString:wkstr];

   int row;
   for (row=1;row <7;row++){
      for (i =0 ;i<3;++i){
            NSMutableArray *monArray = (NSMutableArray *)[yearArray objectAtIndex:i];
            for (j = (row-1)*7;j < row*7;++j){
                [ms appendString:(NSString* ) [monArray objectAtIndex:j]];
                [ms appendString:@" "];
            }
            [ms appendString:@"   "];
    }
    [ms appendString:@"\n"];
   }

   [ms appendString:mon2];
   [ms appendString:wkstr];
   for (row=1;row <7;row++){
      for (i =3 ;i<6;++i){
            NSMutableArray *monArray = (NSMutableArray *)[yearArray objectAtIndex:i];
            for (j = (row-1)*7;j < row*7;++j){
                [ms appendString:(NSString* ) [monArray objectAtIndex:j]];
                [ms appendString:@" "];
            }
            [ms appendString:@"   "];
    }
    [ms appendString:@"\n"];
   }

   [ms appendString:mon3];
   [ms appendString:wkstr];
   for (row=1;row <7;row++){
      for (i =6 ;i<9;++i){
            NSMutableArray *monArray = (NSMutableArray *)[yearArray objectAtIndex:i];
            for (j = (row-1)*7;j < row*7;++j){
                [ms appendString:(NSString* ) [monArray objectAtIndex:j]];
                [ms appendString:@" "];
            }
            [ms appendString:@"   "];
    }
    [ms appendString:@"\n"];
   }

   [ms appendString:mon4];
   [ms appendString:wkstr];
   for (row=1;row <7;row++){
      for (i =9 ;i<12;++i){
            NSMutableArray *monArray = (NSMutableArray *)[yearArray objectAtIndex:i];
            for (j = (row-1)*7;j < row*7;++j){
                [ms appendString:(NSString* ) [monArray objectAtIndex:j]];
                [ms appendString:@" "];
            }
            [ms appendString:@"   "];
    }
    [ms appendString:@"\n"];
   }
   NSLog(ms);
}
 // getter and setter
 /*
- (void)setYearIndator:(int)yearInd {
  yearIndator = yearInd;
}

- (int)yearIndator {
  return yearIndator;
}
*/
@end
