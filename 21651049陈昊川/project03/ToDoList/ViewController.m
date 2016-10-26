//
//  ViewController.m
//  ToDoList
//
//  Created by Nick Alan on 10/26/16.
//  Copyright © 2016 Nick Alan. All rights reserved.
//

#import "ViewController.h"
#import "ToDoListTableViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation ViewController
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if(sender != self.addButton) return;
//    if(self.textField.text.length>0)
//    {
//        self.toDoItem = [[CHCToDoItem alloc] init];
//        self.toDoItem.itemName = self.textField.text;
//        self.toDoItem.completed = NO;
//    }
//}
-(void)BtnClick:(UIButton*)btn
{
    if(self.textField.text.length>0)
    {
        self.toDoItem = [[CHCToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
        ToDoListTableViewController *toDL = [[ToDoListTableViewController alloc] init];
        toDL.returnTextBlock = ^(CHCToDoItem *toDoList){
            toDoList = self.toDoItem;
        };
//        [self.navigationController pushViewController:toDL animated:YES];
//        [detailvc release];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_addButton addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
