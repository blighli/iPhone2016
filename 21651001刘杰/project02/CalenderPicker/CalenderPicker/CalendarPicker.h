//
//  CalendarPicker.h
//  CalendarPicker
//
//  Created by Tsunami_lj on 16/10/19.
//  Copyright © 2016年 Tsunami_lj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarPicker : UIView<UICollectionViewDataSource>
@property (nonatomic , strong) NSDate *date;
@property (nonatomic , strong) NSDate *today;

+ (instancetype)showOnView:(UIView *)view;
@end
