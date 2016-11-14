//
//  YearAndMonthView.h
//  Calendar
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YearAndMonthButtonView : UIButton

@property (nonatomic)NSInteger year;
@property (nonatomic)NSInteger month;

- (void)toogleArrowImage;


@end
