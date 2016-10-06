#include "cal.h"
int main(int argc,const char *argv[]){
    NSAutoreleasePool * pool =  [[NSAutoreleasePool alloc] init];
    if (argc > 3) {
      NSLog(@"Invalidate params");
    }else if (argc ==2) {
        int year = atoi(argv[1]);
        if (year < 1970){
          NSLog(@"年份值不合法：请使用 1970+");
          exit(1);
        }
        YearFormatter  * yf = [YearFormatter initWithYear:year];
        [yf print];
    }else if(argc == 3){
        int month = atoi(argv[1]);
        if (month > 12 || month < 1){
          NSLog(@"月份值不合法：请使用 1-12");
          exit(1);
        }
        int year = atoi(argv[2]);
        if (year < 1970){
          NSLog(@"年份值不合法：请使用 1970+");
          exit(1);
        }
        MonthFormatter *mf  = [MonthFormatter  initByMonth:month AndYear: year];
        [mf print];
    }else{
      NSLog(@"no argument");
      NSDateComponents *todayComps =
          [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit |
                               NSYearCalendarUnit | NSWeekdayCalendarUnit
                      fromDate:[NSDate date]];
      int year = (int)[todayComps year];
      int month = (int)[todayComps month];
      MonthFormatter *mf  = [MonthFormatter  initByMonth:month AndYear: year];
      [mf print];
    }
    // [mf print];
    [pool drain];
    return 0;
}
