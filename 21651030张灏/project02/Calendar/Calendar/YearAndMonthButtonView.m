//
//  YearAndMonthView.m
//  Calendar
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "YearAndMonthButtonView.h"
#import "UIView+FrameProcessor.h"

@interface YearAndMonthButtonView ()

@property (nonatomic)UILabel *yearLabel;
@property (nonatomic)UILabel *monthLabel;
@property (nonatomic)UIImageView *arrowImageView;
@property (nonatomic) NSArray *monthStringArray;

@end

@implementation YearAndMonthButtonView


- (instancetype)init
{
	self = [super init];
	if (self) {
		[self configureViews];
		self.year = [self currentYear];
		self.month = [self currentMonth];
	}
	return self;
}

- (void)configureViews
{
	//self.backgroundColor = [UIColor redColor];
	[self addSubview:self.monthLabel];
	[self addSubview:self.yearLabel];
	[self addSubview:self.arrowImageView];
	
	self.monthLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.monthLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.monthLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
	
	self.yearLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.yearLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.monthLabel attribute:NSLayoutAttributeRight multiplier:1 constant:5]];
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.yearLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.monthLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
	
	self.arrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.yearLabel attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.yearLabel attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

- (CGSize)sizeThatFits:(CGSize)size
{
	[self.yearLabel sizeToFit];
	[self.monthLabel sizeToFit];
	[self.arrowImageView sizeToFit];
	return CGSizeMake(self.yearLabel.size.width + 5 + self.monthLabel.size.width + self.arrowImageView.size.width, self.monthLabel.size.height);
}

- (void)toogleArrowImage
{
	NSLog(@"toogleArrowImage");
	self.arrowImageView.transform = CGAffineTransformRotate(self.arrowImageView.transform, M_PI);
}


#pragma mark - Accessor Methods
- (UILabel *)yearLabel
{
	if (_yearLabel == nil)
	{
		_yearLabel = [[UILabel alloc] init];
		_yearLabel.font = [UIFont systemFontOfSize:15];
		_yearLabel.backgroundColor = [UIColor clearColor];
		_yearLabel.text = [NSString stringWithFormat:@"%ld", [self currentYear]];
	}
	
	return _yearLabel;
}

- (UILabel *)monthLabel
{
	if (_monthLabel == nil)
	{
		_monthLabel = [[UILabel alloc] init];
		_monthLabel.font = [UIFont systemFontOfSize:25];
		_monthLabel.backgroundColor = [UIColor clearColor];
		_monthLabel.text = self.monthStringArray[[self currentMonth] - 1];
	}
	
	return _monthLabel;
}

- (UIImageView *)arrowImageView
{
	if (_arrowImageView == nil)
	{
		CGFloat length = 8;
		UIGraphicsBeginImageContext(CGSizeMake(length, length / 2));
		UIBezierPath *path = [[UIBezierPath alloc] init];
		[path moveToPoint:CGPointMake(0, 0)];
		[path addLineToPoint:CGPointMake(length, 0)];
		[path addLineToPoint:CGPointMake(length / 2, length / 2)];
		[path closePath];
		[[UIColor blackColor] set];
		[path stroke];
		[path fill];
		UIImage *arrowImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		_arrowImageView = [[UIImageView alloc] initWithImage:arrowImage];
	}
	
	return _arrowImageView;
}

- (void)setYear:(NSInteger)year
{
	_year = year;
	self.yearLabel.text = [NSString stringWithFormat:@"%ld", year];
}

- (void)setMonth:(NSInteger)month
{
	_month = month;
	self.monthLabel.text = self.monthStringArray[month - 1];
}


- (NSArray *)monthStringArray
{
	if (_monthStringArray == nil)
	{
		_monthStringArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"];
	}
	return _monthStringArray;
}

- (NSInteger)currentYear
{
	NSDate *date =[NSDate date];
	NSDateComponents *components = [[NSDateComponents alloc] init];
	NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
	components = [calendar components:NSCalendarUnitYear fromDate:date];
	//NSLog(@"components.year: %ld", components.year);
	return components.year;
}

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
