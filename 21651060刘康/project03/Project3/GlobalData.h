//
//  GlobalData.h
//  Project3
//
//  Created by Edward Lin on 2016/10/26.
//  Copyright © 2016年 Edward Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalData : NSObject

@property (nonatomic, strong) NSArray *tasks;

+ (instancetype)sharedData;

@end
