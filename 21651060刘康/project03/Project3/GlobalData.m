//
//  GlobalData.m
//  Project3
//
//  Created by Newcon on 2016/10/26.
//

#import "GlobalData.h"

@implementation GlobalData

+ (instancetype)sharedData {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

@end
