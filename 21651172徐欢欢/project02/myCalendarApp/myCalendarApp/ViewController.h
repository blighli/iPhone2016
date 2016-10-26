//
//  ViewController.h
//  myCalendarApp
//
//  Created by 徐欢欢 on 16/10/26.
//  Copyright © 2016年 徐欢欢. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

//CollectionViewHeader
@interface CalendarHeaderView : UICollectionReusableView
@end

//UICollectionViewCell
@interface CalendarCell : UICollectionViewCell
@property (weak, nonatomic) UILabel *dayLabel;

@property (strong, nonatomic) MonthModel *monthModel;
@end

//存储模型
@interface MonthModel : NSObject
@property (assign, nonatomic) NSInteger dayValue;
@property (strong, nonatomic) NSDate *dateValue;
@property (assign, nonatomic) BOOL isSelectedDay;
@end


