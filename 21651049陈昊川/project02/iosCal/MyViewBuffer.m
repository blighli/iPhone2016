//
//  MyViewBuffer.m
//  MyCal
//
//  Created by Nick Alan on 10/23/16.
//  Copyright © 2016 Nick Alan. All rights reserved.
//

#import "MyViewBuffer.h"

@interface MyViewBuffer()
{
    NSMutableString *_buffer;
}
-(NSString*)rowString:(NSInteger)row;

@end

@implementation MyViewBuffer

-(instancetype)initWithWidth:(NSInteger)width andHeight:(NSInteger)height
{
    self = [super init];
    if(self){
        _width = width;
        _height = height;
        
        NSString *strContent = [@"" stringByPaddingToLength:width*height withString:@" " startingAtIndex:0];
        _buffer = [NSMutableString stringWithString:strContent];
    }
    return self;
}

-(NSString *)rowString:(NSInteger)row
{
    return [_buffer substringWithRange:NSMakeRange(_width*row, _width)];
}

-(void)writeString:(NSString*)str toX:(NSInteger)x andY:(NSInteger)y
{
    NSInteger startIndex = x + y*_width;
    [_buffer replaceCharactersInRange:NSMakeRange(startIndex, str.length) withString:str];
}

-(void)copyFromViewBuffer:(MyViewBuffer*)viewBuffer toX:(NSInteger)x andY:(NSInteger)y
{
    for(NSInteger row = 0;row<viewBuffer.height;row++)
    {
        NSInteger startIndex = x + y * _width;
        NSString *str = [viewBuffer rowString:row];
        [_buffer replaceCharactersInRange:NSMakeRange(startIndex, str.length) withString:str];
    }
}

-(NSString*)display
{
    NSString *str=@"";
    for(int row = 0;row<_height;row++)
    {
        str = [str stringByAppendingString:[NSString stringWithFormat:@"%@\n",[self rowString:row]]];
    }
    return str;
}
@end
