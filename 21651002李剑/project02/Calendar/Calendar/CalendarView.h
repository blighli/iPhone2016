//
//  CalendarView.h
//  Calendar
//
//  Created by 李剑 on 16/10/18.
//  Copyright © 2016年 mutouren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarModel.h"

@interface CalendarView : UIView

@property (nonatomic)CalendarModel *calendarModel;

- (CGSize)minBoundingSize;

@end
