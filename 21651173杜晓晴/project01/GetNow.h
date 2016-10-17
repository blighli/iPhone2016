//
//  GetNow.h
//  Calendar
//
//  Created by duxiaoqing on 10/6/16.
//  Copyright © 2016 duxiaoqing. All rights reserved.
//

#ifndef GetNow_h
#define GetNow_h
#import <Foundation/Foundation.h>

@interface YearAndMonthNow : NSObject

@property(nonatomic) int yearNow;
@property(nonatomic) int monthNow;

- (void) yearAndMonth;

@end
#endif /* GetNow_h */
