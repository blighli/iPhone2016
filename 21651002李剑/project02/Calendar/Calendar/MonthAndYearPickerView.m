//
//  MonthAndYearPickerView.m
//  Calendar
//
//  Created by 李剑 on 16/10/19.
//  Copyright © 2016年 mutouren. All rights reserved.
//

#import "MonthAndYearPickerView.h"

#import "UIView+FrameProcessor.h"
#import "Macro.h"

@interface MonthAndYearPickerView ()

@property (nonatomic) UIPickerView *monthAndYearPickerView;
@property (nonatomic) UIButton *okButton;
@property (nonatomic) UIButton *cancelButton;

@end

@implementation MonthAndYearPickerView

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self configureViews];
		
	}
	return self;
}

- (void)configureViews
{
	self.backgroundColor = [UIColor whiteColor];
	[self addSubview:self.monthAndYearPickerView];
	[self addSubview:self.cancelButton];
	[self addSubview:self.okButton];
	
	self.monthAndYearPickerView.translatesAutoresizingMaskIntoConstraints = NO;
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.monthAndYearPickerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": self.monthAndYearPickerView}]];

	
	self.cancelButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.cancelButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:self.size.width * 1.0 / 12]];
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.cancelButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.monthAndYearPickerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
	
	self.okButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.okButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant: -self.size.width * 1.0 / 12]];
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.okButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.monthAndYearPickerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
}

- (NSInteger)selectedRowInComponent:(NSInteger)component
{
	return [self.monthAndYearPickerView selectedRowInComponent:component];
}

- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated
{
	[self.monthAndYearPickerView selectRow:row inComponent:component animated:animated];
}

#pragma Accessor methods
- (UIPickerView *)monthAndYearPickerView
{
	if (_monthAndYearPickerView == nil)
	{
		_monthAndYearPickerView = [[UIPickerView alloc] init];
	}
	
	return _monthAndYearPickerView;
}

- (UIButton *)okButton
{
	if (_okButton == nil)
	{
		_okButton = [UIButton buttonWithType:UIButtonTypeSystem];
		_okButton.backgroundColor = [UIColor clearColor];
		_okButton.titleLabel.font = [UIFont systemFontOfSize:18];
		[_okButton setTitle:@"确认" forState:UIControlStateNormal];
	}
	
	return _okButton;
}

- (UIButton *)cancelButton
{
	if (_cancelButton == nil)
	{
		_cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
		_cancelButton.backgroundColor = [UIColor clearColor];
		[_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
		_cancelButton.titleLabel.font = [UIFont systemFontOfSize:18];
		_cancelButton.titleLabel.textColor = [UIColor blackColor];
	}
	
	return _cancelButton;
}

- (void)setPickerViewDelegate:(id<UIPickerViewDelegate>)pickerViewDelegate
{
	_pickerViewDelegate = pickerViewDelegate;
	self.monthAndYearPickerView.delegate = pickerViewDelegate;
}

- (void)setPickerViewDataSource:(id<UIPickerViewDataSource>)pickerViewDataSource
{
	_pickerViewDataSource = pickerViewDataSource;
	self.monthAndYearPickerView.dataSource = pickerViewDataSource;
}

- (void)setActionDelegate:(id<ActionDelegate>)actionDelegate
{
	_actionDelegate = actionDelegate;
	[self.okButton addTarget:actionDelegate action:@selector(didClickOKButton) forControlEvents:UIControlEventTouchUpInside];
	[self.cancelButton addTarget:actionDelegate action:@selector(didClickCancelButton) forControlEvents:UIControlEventTouchUpInside];
}

@end
