//
//  MYViewBuffer.m
//  myCal
//
//  Created by liqilei on 2016/10/6.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import "MYViewBuffer.h"

@interface MYViewBuffer()
{
    NSMutableString* _buffer;
}
- (NSString*)rowString:(NSInteger)row;
@end

@implementation MYViewBuffer

- (NSMutableString*)_buffer_{
    return _buffer;
}
    
- (instancetype)initWithWidth:(NSInteger)width andHeight:(NSInteger)height
{
    self = [super init];
    if (self) {
        _width = width;
        _height = height;
        
        NSString* strContent = [@"" stringByPaddingToLength:width*height withString:@" " startingAtIndex:0];
        _buffer = [NSMutableString stringWithString: strContent];
    }
    return self;
}

- (NSString*)rowString:(NSInteger)row
{
    return [_buffer substringWithRange:NSMakeRange(_width*row, _width)];
}

- (void)writeString:(NSString*)str toX:(NSInteger)x andY:(NSInteger)y
{
    NSInteger startIndex = x + y * _width;
    [_buffer replaceCharactersInRange:NSMakeRange(startIndex, str.length) withString:str];
}

- (void)copyFromViewBuffer:(MYViewBuffer*)viewBuffer toX:(NSInteger)x andY:(NSInteger)y
{
    for(NSInteger row = 0; row < viewBuffer.height; row++){
        NSInteger startIndex = x + (y + row) * _width;
        NSString* str = [viewBuffer rowString:row];
        [_buffer replaceCharactersInRange:NSMakeRange(startIndex, str.length) withString:str];
    }
}

- (NSString*)display
{
    NSMutableString* temp = [[NSMutableString alloc] initWithCapacity:100];
    
    for(int row = 0; row < _height; row++){
        printf("%s\n", [self rowString:row].UTF8String);
        [temp appendString:[self rowString:row]];
        [temp appendString:@"\n"];
    }
    return temp;
}

@end
