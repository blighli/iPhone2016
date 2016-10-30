//
//  ViewController.m
//  Project2
//
//  Created by Newcon on 2016/10/24.
//  Copyright © 2016年 Edward Lin. All rights reserved.
//

#import "ViewController.h"
#import "JKCalendar.h"
#import "CalendarViewCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *outputArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    JKCalendar *jkCalendar = [[JKCalendar alloc] init];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear|NSCalendarUnitWeekday fromDate:currentDate];
    
    NSDate *firstDayOfMonth = [NSDate dateWithTimeIntervalSinceNow:(-24 * 60 * 60 *([components day] - 1))];    //得到当前月的第一天
    _outputArray = [NSArray array];
    _outputArray = [jkCalendar getArrayOfCalendarWithFirstDayOfMonth:firstDayOfMonth];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 49;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalendarViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarViewCell" forIndexPath:indexPath];
    cell.cellLabel.text = _outputArray[indexPath.row + indexPath.section];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger cellWidth = self.collectionView.frame.size.width / 7 - 9;
    CGSize cellSize;
    if (indexPath.section == 0) {
        cellSize.width = self.collectionView.frame.size.width;
        cellSize.height = cellWidth;
    } else {
        cellSize.width = cellWidth;
        cellSize.height = cellWidth;
    }
    cellSize = CGSizeMake(cellSize.width, cellSize.height);
    return cellSize;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
