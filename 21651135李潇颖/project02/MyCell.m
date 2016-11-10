//
//  MyCell.m
//  MyCalendar
//
//

#import "MyCell.h"

@implementation MyCell
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    return self;
}

-(void)setText:(NSString *)srt{
    self.myText.text = srt;
}
@end
