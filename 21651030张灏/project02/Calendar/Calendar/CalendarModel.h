//
//  CalendarModel.h
//  Calendar
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarModel : NSObject

@property (nonatomic)NSInteger month;
@property (nonatomic)NSInteger year;

- (void)setYear:(NSInteger)year andMonth:(NSInteger)month;
- (NSArray *)getMonthModel;

@end
