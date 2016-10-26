//
//  ViewController.m
//  TaskList
//
//  Created by iOSChenYi on 16-10-18.
//  Copyright (c) 2016年 ChenYi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *inputTask;
@property (weak, nonatomic) IBOutlet UITableView *taskList;


@end

@implementation ViewController
{
    NSMutableArray* list;
    BOOL isEditing;
}

- (IBAction)addTask:(UIButton *)sender {
    NSString *task=[NSString stringWithString:[_inputTask text]];
    if (![task isEqual:@""])
    {
        [_inputTask setText:@""];
        [_inputTask resignFirstResponder];
        
        [list insertObject:task atIndex:0];
        
        NSIndexPath *index=[NSIndexPath indexPathForRow:0 inSection:0];
        
        [_taskList reloadData];
        [_taskList scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionTop animated:true];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Sample"];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Sample"];
    }
    NSUInteger row=[indexPath row];
    cell.textLabel.text=[list objectAtIndex:row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *task=[list objectAtIndex:[indexPath row]];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Task" message:task delegate:self cancelButtonTitle:@"Return" otherButtonTitles:nil];
    [alert show];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [list count];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [list removeObjectAtIndex:[indexPath row]];
    [_taskList deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (IBAction)setEdit:(UIButton *)sender {
    if (isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [_taskList setEditing:NO animated:NO];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [_taskList setEditing:YES animated:YES];
    }
    isEditing=!isEditing;
    [_inputTask resignFirstResponder];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSString* src=[list objectAtIndex:[sourceIndexPath row]];
    [list removeObjectAtIndex:[sourceIndexPath row]];
    [list insertObject:src atIndex:[destinationIndexPath row]];
    [_taskList reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[_inputTask layer] setBorderWidth:1];
    [[_inputTask layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[_inputTask layer] setCornerRadius:10];
    
    list=[NSMutableArray arrayWithContentsOfFile:[self fileName]];
    if(list==nil)
    {
        list=[[NSMutableArray alloc] init];
    }
    
    [_taskList setDelegate:self];
    [_taskList setDataSource:self];
    
    isEditing=false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_inputTask resignFirstResponder];
}

-(void)saveTaskList
{
    [list writeToFile:[self fileName] atomically:YES];
}

- (NSString*)fileName
{
    NSString *path=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName=[path stringByAppendingString:@"Tasks.plist"];
    
    return fileName;
}
@end
