#import <Foundation/Foundation.h>
#import "Cal.h"

int main(int argc, char *argv[])
{

  Cal* cal = [[Cal alloc] init];

  [cal calByYear: 2016];
  [cal calByMonth:10 AndYear: 2016];

  [cal release];

  return 0;
}