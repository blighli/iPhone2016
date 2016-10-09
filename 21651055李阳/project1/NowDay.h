//
//  NowDay.h
//  MyCal
//
//  Created by 李阳 on 2016/10/8.
//  Copyright © 2016年 李阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NowDay : NSObject
@property(nonatomic) int yearNow;
@property(nonatomic) int monthNow;

-(void)yearAndMonth;

@end
