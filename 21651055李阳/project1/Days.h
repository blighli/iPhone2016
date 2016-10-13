//
//  Days.h
//  MyCal
//
//  Created by 李阳 on 2016/10/8.
//  Copyright © 2016年 李阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Days : NSObject
//是否是闰年
+(BOOL)isLeapYear:(int)year;

//计算从公元0年到你输入的上一年总共有多少天
+(int)daysOfUntilLastYear:(int)year;

//计算公元0年到你输入上个月共有多少天
+(int)daysOfUntilLastMonth:(int)year yue:(int)yue;

@end
