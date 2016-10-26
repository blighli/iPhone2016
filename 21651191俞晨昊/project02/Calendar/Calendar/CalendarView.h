//
//  CalendarView.h
//  Created by ych.
//  Copyright © 2016年 mutouren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarModel.h"

@interface CalendarView : UIView

@property (nonatomic)CalendarModel *calendarModel;

- (CGSize)minBoundingSize;

@end
