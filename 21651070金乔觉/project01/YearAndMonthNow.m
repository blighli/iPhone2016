[objc] view plain copy print?

#import "YearAndMonthNow.h"

@implementation YearAndMonthNow

- (void) yearAndMonth{

  NSDate *date = [NSDate date];
  NSCalendar *cal = [NSCalendar currentCalendar];

  unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;

  NSDateComponents *d = [cal components:unitFlags fromDate:date];

  _yearNow = (int)[d year];
  _monthNow = (int)[d month];

}


@end
