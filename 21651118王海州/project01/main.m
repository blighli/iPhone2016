#import <Foundation/Foundation.h>
#import "Cal.h"

int main(int argc, char *argv[])
{
  // the calendar
  Cal* cal = [[Cal alloc] init];

  if (argc == 1) {

    // usage: ./Cal

    [cal calByMonth:10 AndYear: 2026];

  } else if (argc == 2) {

    // usage: ./Cal year

    int year = atoi(argv[1]);

    if (year>=1 && year<=9999) {
      [cal calByYear: year];
    } else {
      printf("Year must be in range 1..9999\n");
    }

  } else if (argc == 3) {

    // usage: ./Cal month year

    int month = atoi(argv[1]);
    int year = atoi(argv[2]);

    if (month>=1 && month<=12) {
      if (year>=1 && year<=9999) {
        [cal calByMonth:month AndYear: year];
      } else {
        printf("Year must be in range 1..9999\n");
      }
    }  else {
      printf("Month must be in range 1..12\n");
    }

  } else {

    // wrong use

    printf("usage: ./Cal \n");
    printf("       ./Cal year\n");
    printf("       ./Cal month year\n");

  }


  // release the calendar
  [cal release];

  return 0;
}