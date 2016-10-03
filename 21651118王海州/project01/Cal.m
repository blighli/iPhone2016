#import <Foundation/Foundation.h>
#import "Cal.h"

@implementation Cal


- (void) calByYear:(int) year
{
  NSLog(@"calByYear %d", year);
}

- (void) calByMonth:(int) month AndYear:(int) year
{
  NSLog(@"calByMonth %d And year %d", month, year);
}

@end