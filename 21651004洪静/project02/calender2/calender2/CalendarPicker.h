//
//  CalendarPicker.h
//  CalendarPicker
//
//  Created by 123 on 16/10/26.
//  Copyright © 2016年 Will. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarPicker : UIView<UICollectionViewDataSource>
@property (nonatomic , strong) NSDate *date;
@property (nonatomic , strong) NSDate *today;

+ (instancetype)showOnView:(UIView *)view;
@end
