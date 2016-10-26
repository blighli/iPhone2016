//
//  CalendarModel.h
//  Calendar
//
//  Created by 李剑 on 16/10/18.
//  Copyright © 2016年 mutouren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarModel : NSObject

@property (nonatomic)NSInteger month;
@property (nonatomic)NSInteger year;

- (void)setYear:(NSInteger)year andMonth:(NSInteger)month;
- (NSArray *)getMonthModel;

@end
