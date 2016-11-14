//
//  CalendarView.h
//  Calendar
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarModel.h"

@interface CalendarView : UIView

@property (nonatomic)CalendarModel *calendarModel;

- (CGSize)minBoundingSize;

@end
