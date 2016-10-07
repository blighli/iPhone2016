//
//  main.m
//  SuperleeCAL
//
//  Created by SuperleeOS on 16/10/7.
//  Copyright © 2016年 SuperleeOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLCal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        printf("%s\n",[SLCal calendarWithArgc:argc argv:argv].UTF8String);
    }
    return 0;
}
