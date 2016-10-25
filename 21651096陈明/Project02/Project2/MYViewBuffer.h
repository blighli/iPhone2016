//
//  MYViewBuffer.h
//  myCal
//
//  Created by liqilei on 2016/10/6.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYViewBuffer : NSObject

@property (readonly) NSInteger width;
@property (readonly) NSInteger height;

- (instancetype)initWithWidth:(NSInteger)width andHeight:(NSInteger)height;
- (void)writeString:(NSString*)str toX:(NSInteger)x andY:(NSInteger)y;
- (void)copyFromViewBuffer:(MYViewBuffer*)viewBuffer toX:(NSInteger)x andY:(NSInteger)y;
- (NSString *)display;

@end
