//
//  YearViewController.m
//  CalendarShow
//
//  Created by Armas on 10/21/16.
//  Copyright © 2016 Armas. All rights reserved.
//

#import "YearViewController.h"
#import <CalLib/CalLib.h>

@interface YearViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation YearViewController
//键盘Done，关闭键盘
- (IBAction)textDidEndOnExit:(id)sender {
    [sender resignFirstResponder];
}
//触摸背景关闭键盘
- (IBAction)backgroundTap:(id)sender {
    [self.textField resignFirstResponder];
}
- (IBAction)buttonPressed:(id)sender {
    NSInteger year = [self.textField.text integerValue];
    Show* show = [[Show alloc] init];
    NSString* yearResult = [show selectYear:year];
    
    if(![yearResult isEqualToString:@""]){
        self.textView.text = yearResult;
    }else{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Year is illegal." message:[NSString stringWithFormat:@"year %ld not in range 1..9999",(long)year] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
        self.textField.text = @"";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
