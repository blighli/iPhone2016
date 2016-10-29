//
//  ViewController.m
//  calApp
//
//  Created by yangfeiyu on 2016/10/20.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//

#import "ViewController.h"
#import "monthData.h"
@interface ViewController()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup af
    calView *view = [[calView alloc] initWithFrame:CGRectMake(40, 40, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    self.CalView = view;
    [_CalView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.CalView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    //JIHANG
//    return 1;
//}
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 3;
//}

@end
