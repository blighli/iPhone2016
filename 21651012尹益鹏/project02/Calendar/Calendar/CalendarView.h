//
//  CalendarView.h
//  Calendar
//
//  Created by yinyipeng on 16/11/10.
//  Copyright © 2016年 snailset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarModel.h"

@interface CalendarView : UIView

@property (nonatomic)CalendarModel *calendarModel;

- (CGSize)minBoundingSize;

@end
