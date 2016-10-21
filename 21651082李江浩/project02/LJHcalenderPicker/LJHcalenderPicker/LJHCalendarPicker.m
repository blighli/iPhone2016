//
//  LJHCalendarPicker.m
//  LJHCalendarPicker
//
//  Created by 李江浩 on 16/10/19.
//  Copyright © 2016年 李江浩. All rights reserved.
//

#import "LJHCalendarPicker.h"
#import "LJHCalendarCell.h"
#import "calendar.h"
NSString *const LJHCalendarCellIdentifier = @"cell";

@interface LJHCalendarPicker ()
@property (nonatomic , weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic , weak) IBOutlet UILabel *monthLabel;
@property (nonatomic , weak) IBOutlet UIButton *previousButton;
@property (nonatomic , weak) IBOutlet UIButton *nextButton;
@property (nonatomic , strong) UIView *mask;//设置底色
@end

@implementation LJHCalendarPicker
+ (instancetype)showOnView:(UIView *)view{
    LJHCalendarPicker *calendarPicker = [[[NSBundle mainBundle] loadNibNamed:@"LJHCalendarPicker" owner:self options:nil] firstObject];
    calendarPicker.mask = [[UIView alloc] initWithFrame:view.bounds];
    calendarPicker.mask.backgroundColor = [UIColor blackColor];
    calendarPicker.mask.alpha = 0.3;
    [view addSubview:calendarPicker.mask];
    [view addSubview:calendarPicker];
    return calendarPicker;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [_collectionView registerClass:[LJHCalendarCell class] forCellWithReuseIdentifier:LJHCalendarCellIdentifier];
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
    LJHCalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LJHCalendarCellIdentifier forIndexPath:indexPath];
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
