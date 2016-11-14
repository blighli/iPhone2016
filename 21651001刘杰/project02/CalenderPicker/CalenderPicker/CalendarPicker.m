//
//  CalendarPicker.m
//  CalendarPicker
//
//  Created by Tsunami_lj on 16/10/19.
//  Copyright © 2016年 Tsunami_lj. All rights reserved.
//

#import "CalendarPicker.h"
#import "CalendarCell.h"
#import "calendar.h"
NSString *const CalendarCellIdentifier = @"cell";

@interface CalendarPicker ()
@property (nonatomic , weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic , weak) IBOutlet UILabel *monthLabel;
@property (nonatomic , weak) IBOutlet UIButton *previousButton;
@property (nonatomic , weak) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIView *view;
@end

@implementation CalendarPicker
+ (instancetype)showOnView:(UIView *)view{
    CalendarPicker *calendarPicker = [[[NSBundle mainBundle] loadNibNamed:@"CalendarPicker" owner:self options:nil] firstObject];
    [view addSubview:calendarPicker];
    return calendarPicker;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [_previousButton setTitle:@"" forState:UIControlStateNormal];
    [_nextButton setTitle:@"" forState:UIControlStateNormal];
    
    _previousButton.frame = CGRectMake(_previousButton.frame.origin.x + 5, _previousButton.frame.origin.y, _previousButton.bounds.size.width, _previousButton.bounds.size.height - 10);
    [_previousButton setBackgroundImage:[UIImage imageNamed:@"left_arrow"] forState:UIControlStateNormal];
    [_nextButton setBackgroundImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
    
    _view.backgroundColor = [UIColor lightGrayColor];
    _collectionView.backgroundColor = [UIColor lightGrayColor];
    [_collectionView registerClass:[CalendarCell class] forCellWithReuseIdentifier:CalendarCellIdentifier];
}

- (void)setDate:(NSDate *)date{
    _date = date;
    [_monthLabel setText:[NSString stringWithFormat:@"%.2ld-%li",(long)[self month:date],(long)[self year:date]]];
    [_collectionView reloadData];
}

#pragma mark - date
- (NSInteger)month:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components month];
}

- (NSInteger)year:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components year];
}

- (NSDate *)previousMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

- (NSDate*)nextMonth:(NSDate *)date{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = +1;
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}

#pragma mark - <UICollectionViewDataSource>
//有几行
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 7;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CalendarCellIdentifier forIndexPath:indexPath];
    calendar *aCalender = [[calendar alloc]init];
    NSArray *contentArray = [NSArray array];
    contentArray = [aCalender outputCalendarWithMonth:[self month:_date] year:[self year:_date]];
    if (indexPath.section < contentArray.count) {
        cell.dateLabel.text = @"     ";
        cell.dateLabel.text = [cell.dateLabel.text stringByAppendingString:contentArray[indexPath.section]];
    } else{
        cell.dateLabel.text = nil;
    }
    return cell;
}


#pragma mark - buttonEvents
- (IBAction)previouseAction:(UIButton *)sender{
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^(void) {
        self.date = [self previousMonth:self.date];
    } completion:nil];
}

- (IBAction)nexAction:(UIButton *)sender{
    [UIView transitionWithView:self duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^(void) {
        self.date = [self nextMonth:self.date];
    } completion:nil];
}



@end
