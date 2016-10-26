

#import <Foundation/Foundation.h>

@interface DKCal : NSObject

+ (instancetype)sharedCal;
- (NSString *)calendarForDate:(NSDate *)date;
- (NSString *)calendarForYear:(int)year;

@end
