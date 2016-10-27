//
//  CalendarPicker.h
//  CalendarPicker
//
//  Created by li xiaowen on 16/10/19.
//  Copyright © 2016年 li xiaowen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarPicker : UIView<UICollectionViewDataSource>
@property (nonatomic , strong) NSDate *date;
@property (nonatomic , strong) NSDate *today;

+ (instancetype)showOnView:(UIView *)view;
@end
