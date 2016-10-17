#import <Foundation/Foundation.h>
#import "myCal.h"

int main(int argc, char *argv[])
{
  // the calendar
  myCal* cal = [[myCal alloc] init];

  if (argc == 1) {

    // usage: ./myCal

    int month, year;
    NSCalendar *ns_cal = [NSCalendar currentCalendar];
    NSDate *startDate = [[NSDate new] autorelease];
    NSDateComponents *dateComps = [ns_cal components:NSYearCalendarUnit|NSMonthCalendarUnit|
               NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:startDate];
    year = [dateComps year];
    month = [dateComps month];

    [cal printByMonthAndYear:month AndYear: year];

  } else if (argc == 2) {

    // usage: ./myCal year

    int year = atoi(argv[1]);

    if (year>=1 && year<=9999) {
      [cal printByYear: year];
    } else {
      printf("Year must be in range 1..9999\n");
    }

  } else if (argc == 3) {

    // usage: ./myCal month year

    int month = atoi(argv[1]);
    int year = atoi(argv[2]);

    if (month>=1 && month<=12) {
      if (year>=1 && year<=9999) {
        [cal printByMonthAndYear:month AndYear: year];
      } else {
        printf("Year must be in range 1..9999\n");
      }
    }  else {
      printf("Month must be in range 1..12\n");
    }

  } else {

    // wrong use

    printf("usage: ./myCal \n");
    printf("       ./myCal year\n");
    printf("       ./myCal month year\n");

  }


  // release the calendar
  [cal release];

  return 0;
}
