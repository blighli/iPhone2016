#import <Foundation/Foundation.h>
#import "Cal.h"

static int daysByMonth[12] = {
  31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
};

static char* strDay[] = {
  "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
};

static char* strMonth[] = {
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
};


@implementation Cal

- (BOOL) isLeapYear:(int) year
{
  if(((year%4==0) && (year%100!=0)) || (year%400==0)) {
    return YES;
  } else {
    return NO;
  }
}

// what day is the first day of the year
- (int) whatFirstDayOfYear:(int) year {
  int day = (year-1)*365 + (year-1)/4 - (year-100)/100 + (year-1)/400;
  return day%7;
}

- (void) calByYear:(int) year
{
  // Feb 28 or 29 days
  if ([self isLeapYear: year]) {
    daysByMonth[1] = 29;
  } else {
    daysByMonth[1] = 28;
  }

  // print year
  printf("                                         %4d\n\n", year);

  // print calendar

  int _1stMonth1stDay = [self whatFirstDayOfYear: year];
  int _2ndMonth1stDay = (_1stMonth1stDay + daysByMonth[0]) % 7;
  int _3rdMonth1stDay = (_2ndMonth1stDay + daysByMonth[1]) % 7;

  for (int curMon = 0; curMon < 12; curMon += 3) {
    if (curMon != 0) {
      _1stMonth1stDay = (_3rdMonth1stDay + daysByMonth[curMon-1]) % 7;
      _2ndMonth1stDay = (_1stMonth1stDay + daysByMonth[curMon]) % 7;
      _3rdMonth1stDay = (_2ndMonth1stDay + daysByMonth[curMon+1]) % 7;
    }

    // month title 
    printf("             %s                          %s                          %s\n",
            strMonth[curMon], strMonth[curMon+1], strMonth[curMon+2]);

    // days title
    for (int i=0; i<3; ++i) {
      for (int j=0; j<7; ++j) {
        printf(" %s", strDay[j]);
      }
      printf(" ");
    }
    printf("\n");

    // days
    char c = ' ';
    int curDay = 1;
    int curDay_m = 1; // middle column curDay
    int curDay_r = 1; //  right column curDay
    while (curDay <= daysByMonth[curMon]
           || curDay_m <= daysByMonth[curMon+1]
           || curDay_r <= daysByMonth[curMon+2]) 
    {

      if (curDay == 1) {
        for (int i=0; i<_1stMonth1stDay; ++i) printf("%4c", c);
      }
      if (curDay <= daysByMonth[curMon]) {
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
          if (curDay_m <= daysByMonth[curMon+1]) {
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
              if (curDay_r <= daysByMonth[curMon+2]) {
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

- (void) calByMonth:(int) month AndYear:(int) year
{
  // Feb 28 or 29 days
  if ([self isLeapYear: year]) {
    daysByMonth[1] = 29;
  } else {
    daysByMonth[1] = 28;
  }

  // print month title and year
    printf("           %s  %4d\n",strMonth[month-1], year);

  // print days title
  for (int j=0; j<7; ++j) {
    printf(" %s", strDay[j]);
  }
  printf("\n");

  // first day of this month
  int month1stDay = [self whatFirstDayOfYear: year];
  for (int i=0; i<month-1; ++i) month1stDay += daysByMonth[i];
  month1stDay %= 7;

  // print days
  char c = ' ';
  int curDay = 1;
  while (curDay <= daysByMonth[month-1]) 
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










