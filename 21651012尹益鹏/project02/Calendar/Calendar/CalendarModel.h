//
//  CalendarModel.h
//  Calendar
//
//  Created by yinyipeng on 16/11/10.
//  Copyright © 2016年 snailset. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarModel : NSObject

@property (nonatomic)NSInteger month;
@property (nonatomic)NSInteger year;

- (void)setYear:(NSInteger)year andMonth:(NSInteger)month;
- (NSArray *)getMonthModel;

@end
