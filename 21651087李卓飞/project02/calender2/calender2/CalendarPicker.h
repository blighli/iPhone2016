//
//  CalendarPicker.h
//  CalendarPicker
//
//  Created by LZF on 16/10/26.
//  Copyright © 2016年 LZF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarPicker : UIView<UICollectionViewDataSource>
@property (nonatomic , strong) NSDate *date;
@property (nonatomic , strong) NSDate *today;

+ (instancetype)showOnView:(UIView *)view;
@end
