//
//  MonthAndYearPickerView.h
//  Calendar
//
//  Created by 李剑 on 16/10/19.
//  Copyright © 2016年 mutouren. All rights reserved.
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
