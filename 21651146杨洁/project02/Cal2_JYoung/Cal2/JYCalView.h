//
//  JYCallView.h
//  Cal2
//
//  Created by JYoung on 17/10/2016.
//  Copyright © 2016 JYoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYCalView : UIView

@property (nonatomic, copy) NSString *dateString;

+ (instancetype)callViewWithDateString:(NSString *)dateString;

@end

