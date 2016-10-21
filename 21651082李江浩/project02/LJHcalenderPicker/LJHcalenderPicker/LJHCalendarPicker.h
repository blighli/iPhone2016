//
//  LJHCalendarPicker.h
//  LJHCalendarPicker
//
//  Created by 李江浩 on 16/10/19.
//  Copyright © 2016年 李江浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJHCalendarPicker : UIView<UICollectionViewDataSource>
@property (nonatomic , strong) NSDate *date;
@property (nonatomic , strong) NSDate *today;

+ (instancetype)showOnView:(UIView *)view;
@end
