//
//  CalendarModel.h
//  Calendar
//  Created by ych.
//

#import <Foundation/Foundation.h>

@interface CalendarModel : NSObject

@property (nonatomic)NSInteger month;
@property (nonatomic)NSInteger year;

- (void)setYear:(NSInteger)year andMonth:(NSInteger)month;
- (NSArray *)getMonthModel;

@end
