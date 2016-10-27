//
//  ViewController.m
//  calendar
//
//  Created by sally on 16/10/26.
//  Copyright © 2016年 sally. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//@synthesize taskListArray

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect r = [[UIScreen mainScreen] bounds];
    NSInteger r_width = r.size.width;
    
    //---textField---------
    self.taskField = [[UITextField alloc] initWithFrame:CGRectMake((r_width-300)/2, 30, 200, 30)];
    [self.view addSubview:self.taskField];
    self.taskField.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.taskField.placeholder = @"Insert a task you want to insert";
    self.taskField.textColor = [UIColor brownColor];
    self.taskField.font = [UIFont fontWithName:@"Arial" size:17];
    self.taskField.textAlignment = NSTextAlignmentLeft;
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    
    //----button-----------
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:self.insertButton];
    self.insertButton.frame = CGRectMake((r_width-300)/2 + 210, 30, 100, 30);
    self.insertButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.insertButton setTitle:@"INSERT" forState:UIControlStateNormal];
    [self.insertButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //----tableView---------
    self.taskList = [[UITableView alloc] initWithFrame:CGRectMake((r_width-320)/2, 88, 320, 400) style:UITableViewStylePlain];
    self.taskListArray = [[NSMutableArray alloc] initWithObjects:@"Sleep",@"Eat",@"Work", nil];
    [self.taskList setDelegate:self];
    [self.taskList setDataSource:self];
    [self.view addSubview:self.taskList];
}

- (void)btnClick {
    NSString * textInput = self.taskField.text;
    if (![textInput isEqualToString:@""] && textInput != nil) {
        [self.taskListArray addObject:textInput];
        [self.taskList reloadData];
        [self.taskField setText:nil];
    }
    NSLog(@"%@", self.taskField.text);
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Task List";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.taskListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    }
    
    [[cell textLabel] setText:[self.taskListArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
