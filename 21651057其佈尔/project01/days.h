//
//  Days.h
//  test
//
//  Created by sally on 16/10/6.
//  Copyright © 2016年 sally. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Days : NSObject

+ (BOOL) isLeap : (int)year;
+ (int) daysUntilLastYear : (int)year;
+ (int) daysUntilLastMonth : (int)year month:(int)month;

@end
