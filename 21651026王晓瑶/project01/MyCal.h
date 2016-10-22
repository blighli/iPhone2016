
#import <Foundation/Foundation.h>

@interface MyCal: NSObject

@property (class, strong, nonatomic) NSArray<NSString *> *kNumArray;

- (void)showCalendarWithYear:(NSUInteger)year minMonth:(NSUInteger)minMonth maxMonth:(NSUInteger)maxMonth andTimes:(NSUInteger)times;
- (bool)isLegal:(const char *)str;
- (bool)isMonth:(NSUInteger)month;

@end
