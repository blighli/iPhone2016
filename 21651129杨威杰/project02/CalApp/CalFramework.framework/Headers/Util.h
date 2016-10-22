//
//  Util.h
//  Cal
//
//  Created by yangwj on 16/10/7.
//  Copyright © 2016年 yangwj. All rights reserved.
//

#ifndef Util_h
#define Util_h

@class MonthInfo;

@interface Util : NSObject

+(void)printwithYear:(NSInteger)year;

+(void)printwithYear:(NSInteger)year withMonth:(NSInteger)month;

+(NSMutableString *)generatewithYear:(NSInteger)year withMonth:(NSInteger)month;

+(NSString *)monthtoChinese:(NSInteger)num;

+(NSMutableString *)appendBlank:(NSMutableString *)str withNum:(NSInteger)num;

@end


#endif /* Util_h */
