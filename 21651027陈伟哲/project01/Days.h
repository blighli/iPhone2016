//
//  Days.h
//  Cal
//
//  Created by cwz on 16/10/4.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Days : NSObject

+(BOOL)isLeapYear:(int)year;
+(int)daysOfUntilLastYear:(int)year;
+(int)daysOfUntilLastMonth:(int)year month:(int)month;

@end
