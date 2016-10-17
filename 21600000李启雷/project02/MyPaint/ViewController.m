//
//  ViewController.m
//  MyPaint
//
//  Created by liqilei on 2016/10/4.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet MyView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _msgLabel.text = @"Good";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnHelloPressed:(id)sender {
     _msgLabel.text = @"Hello";
}
- (IBAction)btnByePressed:(id)sender {
     _msgLabel.text = @"Bye";
}

@end
