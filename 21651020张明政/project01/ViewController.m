//
//  ViewController.m
//  Button Fun
//
//  Created by Benjamin on 16/9/26.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation ViewController


- (IBAction)buttonPress:(UIButton *)sender {
    NSString *title=[sender titleForState:UIControlStateNormal];
    
    NSString *plainText=[NSString stringWithFormat:@"%@ button pressed.",title];
    
    NSMutableAttributedString *styledText=[[NSMutableAttributedString alloc]initWithString:plainText];
    
    NSDictionary *attributes=@{
                               NSFontAttributeName :[UIFont boldSystemFontOfSize:_statusLabel.font.pointSize]
                               };
    
    NSRange nameRange=[plainText rangeOfString:title];
    
    [styledText setAttributes:attributes range:nameRange];
    
    _statusLabel.attributedText=styledText;
}
@end
