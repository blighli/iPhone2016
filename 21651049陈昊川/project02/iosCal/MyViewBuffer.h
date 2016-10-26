//
//  MyViewBuffer.h
//  MyCal
//
//  Created by Nick Alan on 10/23/16.
//  Copyright © 2016 Nick Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyViewBuffer : NSObject

@property (readonly) NSInteger width;
@property (readonly) NSInteger height;

-(instancetype)initWithWidth:(NSInteger)width andHeight:(NSInteger)height;
-(void)writeString:(NSString*)str toX:(NSInteger)x andY:(NSInteger)y;
-(void)copyFromViewBuffer:(MyViewBuffer*)viewBuffer toX:(NSInteger)x andY:(NSInteger)y;
-(NSString*)display;

@end
