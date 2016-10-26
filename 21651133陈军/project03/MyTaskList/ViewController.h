//
//  ViewController.h
//  MyTaskList
//
//  Created by Chanjun2016 on 16/10/26.
//  Copyright © 2016年 Chanjun2016. All rights reserved.
//

#import <UIKit/UIKit.h>

//NSString *docPath(void);

@interface ViewController : UIViewController

-(void)longTap:(UILongPressGestureRecognizer *)longRecognizer;

-(void)copyItemClicked:(id)sender;

-(void)resendItemClicked:(id)sender;
@end

