//
//  main.m
//  cal
//
//  Created by Chanjun2016 on 16/10/6.
//  Copyright © 2016年 Chanjun2016. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Calendar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        char * result = [[Calendar getInstance] handleInput:argc :argv];
        if (strlen(result)){
            printf("%s\n",result);
            free(result);
        }
    }
    
    return 0;
}
