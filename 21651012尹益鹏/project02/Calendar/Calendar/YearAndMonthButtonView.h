//
//  YearAndMonthView.h
//  Calendar
//
//  Created by yinyipeng on 16/11/10.
//  Copyright © 2016年 snailset. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YearAndMonthButtonView : UIButton

@property (nonatomic)NSInteger year;
@property (nonatomic)NSInteger month;

- (void)toogleArrowImage;


@end
