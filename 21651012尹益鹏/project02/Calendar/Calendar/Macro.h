//
//  Macro.h
//  京东金融（仿）
//
//  Created by yinyipeng on 16/11/10.
//  Copyright © 2016年 snailset. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

#define backgroundColorWhite [UIColor colorWithWhite:0.93 alpha:1.000]

//#define weakify(...) \
//autoreleasepool {} \
//metamacro_foreach_cxt(ext_weakify_,, __weak, __VA_ARGS__)
//
//#define strongify(...) \
//autoreleasepool {} \
//_Pragma("clang diagnostic push") \
//_Pragma("clang diagnostic ignored \"-Wshadow\"") \
//metamacro_foreach(ext_strongify_,, __VA_ARGS__) \
//_Pragma("clang diagnostic pop")



#endif /* Macro_h */
