//
//  main.m
//  zm_cal
//
//  Created by 123 on 16/10/8.
//  Copyright © 2016年 123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "zmcal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
       printf("%s\n",[zmcal calendarWithArgc:argc argv:argv].UTF8String);
    }
    return 0;
}
