//
//  ViewController.m
//  TaskList
//
//  Created by Armas on 10/21/16.
//  Copyright © 2016 Armas. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textView;

@end

@implementation ViewController

-(IBAction)backgroundTap:(id)sender{
    [self.textView resignFirstResponder];
}

- (IBAction)insertPressed:(id)sender {
    NSString* text = [self.textView text];
    if(![text isEqualToString:@""]){
        AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [appDelegate.tasklist addObject:text];
        [self.tableView reloadData];
        self.textView.text = @"";
        [self.textView resignFirstResponder];
    }
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return [appDelegate.tasklist count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSString* item = [appDelegate.tasklist objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:item];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
