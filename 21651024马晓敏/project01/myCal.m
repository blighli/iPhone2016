#import <Foundation/Foundation.h>
#import "myCal.h"

// 定义常量
static int DAYSOFMONTH[12] = {
  31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
};

static char* WEEKDAY[] = {
  "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
};

static char* MONTH[] = {
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
};


@implementation myCal

// 判断是否为闰年
- (BOOL) isLeapYear:(int) year
{
  if(((year%4==0) && (year%100!=0)) || (year%400==0)) {
    return YES;
  } else {
    return NO;
  }
}

// 计算给定年份的第一天
- (int) firstDayOfYear:(int) year {
  int day = (year-1)*365 + (year-1)/4 - (year-100)/100 + (year-1)/400;
  return day%7;
}

- (void) printByYear:(int) year
{
  // 修改二月天数
  if ([self isLeapYear: year]) {
    DAYSOFMONTH[1] = 29;
  } else {
    DAYSOFMONTH[1] = 28;
  }

  // 输出年份
  printf("                                         %4d\n\n", year);

  // 打印日历

  int _1stMonth1stDay = [self firstDayOfYear: year];
  int _2ndMonth1stDay = (_1stMonth1stDay + DAYSOFMONTH[0]) % 7;
  int _3rdMonth1stDay = (_2ndMonth1stDay + DAYSOFMONTH[1]) % 7;

  for (int curMon = 0; curMon < 12; curMon += 3) {
    if (curMon != 0) {
      _1stMonth1stDay = (_3rdMonth1stDay + DAYSOFMONTH[curMon-1]) % 7;
      _2ndMonth1stDay = (_1stMonth1stDay + DAYSOFMONTH[curMon]) % 7;
      _3rdMonth1stDay = (_2ndMonth1stDay + DAYSOFMONTH[curMon+1]) % 7;
    }

    // 输出月份 
    printf("             %s                          %s                          %s\n",
            MONTH[curMon], MONTH[curMon+1], MONTH[curMon+2]);

    
    for (int i=0; i<3; ++i) {
      for (int j=0; j<7; ++j) {
        printf(" %s", WEEKDAY[j]);
      }
      printf(" ");
    }
    printf("\n");

   
    char c = ' ';
    int curDay = 1;
    int curDay_m = 1; // middle column curDay
    int curDay_r = 1; //  right column curDay
    while (curDay <= DAYSOFMONTH[curMon]
           || curDay_m <= DAYSOFMONTH[curMon+1]
           || curDay_r <= DAYSOFMONTH[curMon+2]) 
    {

      if (curDay == 1) {
        for (int i=0; i<_1stMonth1stDay; ++i) printf("%4c", c);
      }
      if (curDay <= DAYSOFMONTH[curMon]) {
        printf("%4d", curDay);
      } else {
        printf("%4c", c);
      }
      
      // middle column  
      if ((_1stMonth1stDay+curDay-1)%7 == 6) {
        printf(" ");

        while (1) {
        
          if (curDay_m == 1) {
            for (int i=0; i<_2ndMonth1stDay; ++i) printf("%4c", c);
          }
          if (curDay_m <= DAYSOFMONTH[curMon+1]) {
            printf("%4d", curDay_m);
          } else {
            printf("%4c", c);
          }

          // right column
          if ((_2ndMonth1stDay+curDay_m-1)%7 == 6) {
            printf(" ");

            while (1) {
              if (curDay_r == 1) {
                for (int i=0; i<_3rdMonth1stDay; ++i) printf("%4c", c);
              }
              if (curDay_r <= DAYSOFMONTH[curMon+2]) {
                printf("%4d", curDay_r);
              } else {
                printf("%4c", c);
              }

              if ((_3rdMonth1stDay+curDay_r-1)%7 == 6) {
                printf("\n");
                ++curDay_r; break;
              }

              ++curDay_r;
            }

            ++curDay_m; break;
          } 

          ++curDay_m;
        }
      }

      ++curDay;
    }

    printf("\n");

  }

}

- (void) printByMonthAndYear:(int) month AndYear:(int) year
{
  // 修改二月天数
  if ([self isLeapYear: year]) {
    DAYSOFMONTH[1] = 29;
  } else {
    DAYSOFMONTH[1] = 28;
  }

    printf("           %s  %4d\n",MONTH[month-1], year);

  for (int j=0; j<7; ++j) {
    printf(" %s", WEEKDAY[j]);
  }
  printf("\n");

  int month1stDay = [self firstDayOfYear: year];
  for (int i=0; i<month-1; ++i) month1stDay += DAYSOFMONTH[i];
  month1stDay %= 7;

  char c = ' ';
  int curDay = 1;
  while (curDay <= DAYSOFMONTH[month-1]) 
  {

    if (curDay == 1) {
      for (int i=0; i<month1stDay; ++i) printf("%4c", c);
    }
    printf("%4d", curDay);
      
    if ((month1stDay+curDay-1)%7 == 6) printf("\n");

    ++curDay;
  }

  printf("\n");

}

@end
