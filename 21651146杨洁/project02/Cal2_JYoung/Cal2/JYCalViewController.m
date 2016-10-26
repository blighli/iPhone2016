//
//  JYCalViewController.m
//  Cal2
//
//  Created by JYoung on 17/10/2016.
//  Copyright © 2016 jyoung. All rights reserved.
//

#import "JYCalViewController.h"
#import "JYCalView.h"
#import "JYCal.h"

@interface JYCalViewController ()

@property (weak, nonatomic) IBOutlet JYCalView *calView;

@end

@implementation JYCalViewController

- (void)viewDidLoad {
    self.calView.dateString = [JYCal getCalStringWithDate:[NSDate date]];
    self.calView.center = CGPointMake(self.view.center.x, self.calView.frame.size.height * 0.5f + 60);
}

@end
