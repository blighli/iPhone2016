//
//  MonthAndYearPickerView.h
//  Calendar
//
//  Created by yinyipeng on 16/11/10.
//  Copyright © 2016年 snailset. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ActionDelegate <NSObject>

- (void)didClickOKButton;
- (void)didClickCancelButton;

@end

@interface MonthAndYearPickerView : UIView

@property (nonatomic) id<UIPickerViewDelegate> pickerViewDelegate;
@property (nonatomic) id<UIPickerViewDataSource> pickerViewDataSource;
@property (nonatomic) id<ActionDelegate>actionDelegate;

- (NSInteger)selectedRowInComponent:(NSInteger)component;
- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated;

@end
