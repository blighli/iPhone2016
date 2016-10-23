//
//  ViewController.m
//  TodoList
//
//  Created by 曦 on 16/10/23.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import "ViewController.h"
#import "TableView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet TableView *tableView;



@end

@implementation ViewController
BOOL flag = true;
- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableView setEditing:NO animated:YES];
       
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




- (void)viewDidUnload {
    [super viewDidUnload];
}
- (IBAction)addData:(UIButton *)sender {
 
    [_textField resignFirstResponder];
    NSString *t = _textField.text;
    [_tableView.data addObject:t];
    [_tableView reloadData];
}

-(IBAction)textFieldDoneEding:(id)sender{
    [sender resignFirstResponder];
    NSString *t = _textField.text;
    [_tableView.data addObject:t];
    [_tableView reloadData];
    
}

-(IBAction)backgroundTap:(id)sender{
    [_textField resignFirstResponder];
}

- (IBAction)deleteData:(UIButton *)sender {
    [_textField resignFirstResponder];
    if(flag){
        [_tableView setEditing:YES animated:YES];
        flag = false;
        [_deleteButton setTitle:@"取消" forState:normal];
    }else{
        [_tableView setEditing:NO animated:YES];
        flag = true;
         [_deleteButton setTitle:@"编辑" forState:normal];
    }
    
}




@end
