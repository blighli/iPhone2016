//
//  CalendarViewController.m
//  Calendar
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "CalendarViewController.h"
#import "CalendarView.h"
#import "CalendarModel.h"
#import "YearAndMonthButtonView.h"
#import "MonthAndYearPickerView.h"

#import "UIView+FrameProcessor.h"
#import "Macro.h"


@interface CalendarViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, ActionDelegate>

@property (nonatomic) CalendarView *calendarView;//显示当月天数分布
@property (nonatomic) NSArray *monthStringArray;//各月份对应的string
@property (nonatomic) MonthAndYearPickerView *monthAndYearPickerView;//选择年月的picker view
@property (nonatomic) YearAndMonthButtonView *yearAndMonthButtonView;//显示当前年月的button，点击可调出或隐藏picker view
@property (nonatomic) UIView *calendarContainerView;//包在calendarView外面的view



@end

@implementation CalendarViewController
{
	BOOL isShowingPickerView;//标识选择年份和月份的picker view是否在显示中
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self configureViews];
	isShowingPickerView = NO;
    // Do any additional setup after loading the view.
}

- (void)configureViews
{
	[self.view addSubview:self.calendarContainerView];
	self.yearAndMonthButtonView.origin = CGPointMake(self.view.bounds.size.width/ 2, kScreenHeight * 100.0 / 568);
	[self.view addSubview:self.yearAndMonthButtonView];//显示当前年月的button，点击可调出或隐藏picker view
}

#pragma mark - Accessor Methods
- (CalendarView *)calendarView
{
	if (_calendarView == nil)
	{
		_calendarView = [[CalendarView alloc] init];
		_calendarView.backgroundColor = [UIColor whiteColor];
		CGSize size = [_calendarView minBoundingSize];
		CGFloat width = ceil(size.width);
		CGFloat height = ceil(size.height);
		_calendarView.size = CGSizeMake(width, height);
	}
	
	return _calendarView;
}

- (UIView *)calendarContainerView
{
	if (_calendarContainerView == nil)
	{
		_calendarContainerView = [[UIView alloc] init];
		_calendarContainerView.backgroundColor = [UIColor whiteColor];
		_calendarContainerView.size = CGSizeMake(self.calendarView.size.width * 1.2, self.calendarView.size.height * 1.2);
		_calendarContainerView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
		self.calendarView.center = [_calendarContainerView convertPoint:_calendarContainerView.center fromView:self.view];
		[_calendarContainerView addSubview:self.calendarView];
		
		_calendarContainerView.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
		_calendarContainerView.layer.shadowRadius = 5.0;
		_calendarContainerView.layer.shadowOpacity = 0.4;
	}
	
	return _calendarContainerView;
}

- (YearAndMonthButtonView *)yearAndMonthButtonView
{
	if (_yearAndMonthButtonView == nil)
	{
		_yearAndMonthButtonView = [[YearAndMonthButtonView alloc] init];
		[_yearAndMonthButtonView addTarget:self action:@selector(yearAndMonthButtonClicked) forControlEvents:UIControlEventTouchUpInside];
		[_yearAndMonthButtonView sizeToFit];
	}
	
	return _yearAndMonthButtonView;
}

- (MonthAndYearPickerView *)monthAndYearPickerView
{
	if (_monthAndYearPickerView == nil)
	{
		_monthAndYearPickerView = [[MonthAndYearPickerView alloc] init];
		//_monthAndYearPickerView.size = CGSizeMake(kScreenWidth, kScreenHeight / 2);
		_monthAndYearPickerView.size = self.calendarContainerView.size;
		_monthAndYearPickerView.center = CGPointMake(kScreenWidth / 2, kScreenHeight / 2);
		_monthAndYearPickerView.actionDelegate = self;
		_monthAndYearPickerView.pickerViewDelegate = self;
		_monthAndYearPickerView.pickerViewDataSource = self;
		_monthAndYearPickerView.transform = CGAffineTransformMakeScale(0.1, 0.1);
		_monthAndYearPickerView.hidden = YES;
		//_monthAndYearPickerView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
		//_monthAndYearPickerView.layer.zPosition = 10;
//		_monthAndYearPickerView.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
//		_monthAndYearPickerView.layer.shadowRadius = 5.0;
//		_monthAndYearPickerView.layer.shadowOpacity = 0.4;
		
		[self.view addSubview:_monthAndYearPickerView];
	}
	
	return _monthAndYearPickerView;
}


- (NSArray *)monthStringArray
{
	if (_monthStringArray == nil)
	{
		_monthStringArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"];
		//_monthStringArray = @[@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"];
	}
	return _monthStringArray;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	if (component == 0) return 20;//前十年和后十年可以选择
	return 12;//12个月份
}

#pragma mark - UIPickerViewDelegate
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	return pickerView.size.width / 2;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return pickerView.size.height / 6;
	//return kScreenHeight * 44.0 / 568;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	if (component == 0) return [NSString stringWithFormat:@"%ld", [self currentYear] + row - 10];
	return self.monthStringArray[row];
}
#pragma mark - ActionDelegate
//点击确定
- (void)didClickOKButton
{
	NSLog(@"didClickOKButton");
	NSInteger year = [self currentYear] + [self.monthAndYearPickerView selectedRowInComponent:0] - 10;
	NSInteger month = 1 + [self.monthAndYearPickerView selectedRowInComponent:1];
	self.yearAndMonthButtonView.year = year;
	self.yearAndMonthButtonView.month = month;
	CalendarModel *newModel = [[CalendarModel alloc] init];
	[newModel setYear:year andMonth:month];
	self.calendarView.calendarModel = newModel;
	[self.calendarView setNeedsDisplay];
	[self hideMonthAndYearPickerView];
}
//点击取消
- (void)didClickCancelButton
{
	NSLog(@"didClickCancelButton");
	[self hideMonthAndYearPickerView];
}


//显示picker view
- (void)showMonthAndYearPickerView
{
	NSLog(@"showMonthAndYearPickerView");
	self.monthAndYearPickerView.hidden = NO;
	//self.obscureButtonView.hidden = NO;
	isShowingPickerView = YES;
	[self.yearAndMonthButtonView toogleArrowImage];
	[UIView animateWithDuration:0.3 animations:^{
		//self.calendarContainerView.center = CGPointMake(-kScreenWidth / 2, kScreenHeight / 2);
		self.calendarContainerView.transform = CGAffineTransformMakeScale(0.1, 0.1);
		self.monthAndYearPickerView.transform = CGAffineTransformMakeScale(1.0, 1.0);
		//self.obscureButtonView.alpha = 0.5;
	}completion:^(BOOL finished){
		if (finished)
		{
			//NSLog(@"%ld", self.yearAndMonthButtonView.year);
			//NSLog(@"%ld", [self currentYear]);
			[self.monthAndYearPickerView selectRow:self.yearAndMonthButtonView.year - [self currentYear] + 10 inComponent:0 animated:YES];
			[self.monthAndYearPickerView selectRow:self.yearAndMonthButtonView.month - 1 inComponent:1 animated:YES];
			//self.calendarContainerView.hidden = YES;
//			[UIView animateWithDuration:0.3 animations:^{
//				self.monthAndYearPickerView.transform = CGAffineTransformMakeScale(1.0, 1.0);
//			}completion:^(BOOL finished){
//				if (finished) NSLog(@"%@", NSStringFromCGRect(self.monthAndYearPickerView.frame));
//			}];
		}
	}];
}
//隐藏picker view
- (void)hideMonthAndYearPickerView
{
	NSLog(@"hideMonthAndYearPickerView");
	[self.yearAndMonthButtonView toogleArrowImage];
	isShowingPickerView = NO;
	self.calendarContainerView.hidden = NO;
	[UIView animateWithDuration:0.3 animations:^{
		self.monthAndYearPickerView.transform = CGAffineTransformMakeScale(0.1, 0.1);
		//self.obscureButtonView.alpha = 0.5;
	}completion:^(BOOL finished){
		if (finished)
		{
			self.monthAndYearPickerView.hidden = YES;
			[UIView animateWithDuration:0.3 animations:^{
				self.calendarContainerView.transform = CGAffineTransformMakeScale(1.0, 1.0);
				//self.calendarContainerView.center = CGPointMake(kScreenWidth / 2, kScreenHeight / 2);
			}completion:nil];
		}
	}];
}
//点击年月按钮
- (void)yearAndMonthButtonClicked
{
	if (!isShowingPickerView)
	{
		NSLog(@"notShowingPickerView");
		[self showMonthAndYearPickerView];
		isShowingPickerView = YES;
	}
	else
	{
		NSLog(@"isShowingPickerView");
		[self hideMonthAndYearPickerView];
		isShowingPickerView = NO;
	}
}
//返回今天所在年份
- (NSInteger)currentYear
{
	NSDate *date =[NSDate date];
	NSDateComponents *components = [[NSDateComponents alloc] init];
	NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
	components = [calendar components:NSCalendarUnitYear fromDate:date];
	//NSLog(@"components.year: %ld", components.year);
	return components.year;
}
//返回今天所在月份
- (NSInteger)currentMonth
{
	NSDate *date =[NSDate date];
	NSDateComponents *components = [[NSDateComponents alloc] init];
	NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
	components = [calendar components:NSCalendarUnitMonth fromDate:date];
	//NSLog(@"components.month: %ld", components.month);
	return components.month;
}
@end
