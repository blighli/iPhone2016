//
//  Util.h
//  Cal
//
//  Created by yangwj on 16/10/7.
//  Copyright © 2016年 yangwj. All rights reserved.
//

#ifndef Util_h
#define Util_h

@class Tuple;

@interface Util : NSObject

+(void)printwithYear:(NSInteger)year;

+(void)printwithYear:(NSInteger)year withMonth:(NSInteger)month;

+(NSString *)oneLinewithBegin:(NSInteger)begin withWeekday:(NSInteger)weekday withMax:(NSInteger)max;

+(NSString *)monthtoChinese:(NSInteger)num;

+(Tuple *)tuplewithYear:(NSInteger)year withMonth:(NSInteger)month;

@end


#endif /* Util_h */
