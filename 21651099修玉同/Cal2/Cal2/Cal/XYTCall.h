//
//  XYTCall.h
//  Cal_XYT
//
//  Created by soulghost on 1/10/2016.
//  Copyright © 2016 xyt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYTCall : NSObject

+ (NSString *)calendarForDate:(NSDate *)date;
+ (NSString *)calendarForYear:(int)year;

@end
