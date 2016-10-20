//
//  YearAndMonthView.h
//  Calendar
//
//  Created by 李剑 on 16/10/19.
//  Copyright © 2016年 mutouren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YearAndMonthButtonView : UIButton

@property (nonatomic)NSInteger year;
@property (nonatomic)NSInteger month;

- (void)toogleArrowImage;


@end
