//
//  ViewController.m
//  MyTaskList
//
//  Created by Chanjun2016 on 16/10/26.
//  Copyright © 2016年 Chanjun2016. All rights reserved.
//

#import "ViewController.h"

//NSString *docPath()
//{
//    NSArray *pathList = NSSearchPathForDirectoriesInDomains(
//                                                            NSDocumentDirectory, NSUserDomainMask, YES);
//    return [[pathList objectAtIndex:0]
//            stringByAppendingPathComponent:@"data.txt"];
//}

NSMutableArray *_tasks;
NSMutableString *s;

@interface ViewController ()
{
   
}

@property (weak, nonatomic) IBOutlet UITextField *taskField;
@property (weak, nonatomic) IBOutlet UIButton *insertButton;
@property (weak, nonatomic) IBOutlet UITableView *taskTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addTask:(UIButton *)sender {
    NSString *text = [_taskField text];
    if ([text  isEqualToString:@""]) {
        return;
    }
    [s setString:@"Heool"];
    
    [_tasks addObject: text];
    [_taskTable reloadData];
    [_taskField setText:@""];
    [_taskField resignFirstResponder];    
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if(action ==@selector(copyItemClicked:)){
        return YES;
    }else if (action==@selector(resendItemClicked:)){
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(void)resendItemClicked:(id)sender{
    NSLog(@"转发");
    //通知代理
}
-(void)copyItemClicked:(id)sender{
    NSLog(@"复制");
    // 通知代理
}

-(void)longTap:(UILongPressGestureRecognizer *)longRecognizer
{
    if (longRecognizer.state==UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuController *menu=[UIMenuController sharedMenuController];
        UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"完成" action:@selector(copyItemClicked:)];
        UIMenuItem *resendItem = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(resendItemClicked:)];
        [menu setMenuItems:[NSArray arrayWithObjects:copyItem,resendItem,nil]];
        [menu setTargetRect: self.view.bounds inView:self];
        [menu setMenuVisible:YES animated:YES];
    }
}


@end
