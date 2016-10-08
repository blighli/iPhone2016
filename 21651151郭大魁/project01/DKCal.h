//
//  DKCal.h
//  Cal_Dakui
//
//  Created by dakui on 7/10/2016.
//  Copyright © 2016 dakui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKCal : NSObject

+ (instancetype)sharedCal;
- (NSString *)calendarForDate:(NSDate *)date;
- (NSString *)calendarForYear:(int)year;

@end
