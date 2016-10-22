//
//  ViewController.h
//  project03
//
//  Created by 缪为正 on 16-10-19.
//  Copyright (c) 2016年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource>
@property NSMutableArray *tasks;
-(NSString *)docPath;
@end
