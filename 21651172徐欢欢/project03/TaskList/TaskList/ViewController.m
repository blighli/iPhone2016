//
//  ViewController.m
//  TaskList
//
//  Created by 徐欢欢 on 16/10/26.
//  Copyright © 2016年 徐欢欢. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UITableView *taskTableView;
@property(strong,nonatomic) NSMutableArray *taskArray;
@property(strong,nonatomic) NSArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSManagedObjectContext *context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSFetchRequest *fetchData = [[NSFetchRequest alloc] initWithEntityName:@"Task"];
    self.arr = [context executeFetchRequest:fetchData error:nil];
    self.taskArray = [[NSMutableArray alloc] initWithArray:[self.arr valueForKey:@"taskname"]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.taskArray.count;
}

//将数组内容赋值给tableview的每一行
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.taskArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTaskButtonClick:(id)sender {
    
    NSString *inputStr = [[NSMutableString alloc] initWithFormat:@"%@",self.inputTextField.text];
    inputStr = [inputStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
  
    if ([inputStr  isEqual: @""]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"忘记填写了亲><" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:true completion:nil];
    } else {
        
        //把数据存储到CoreData中；
        [self saveToCoreData:inputStr];
        //文本存储到taskArray数组中；
        [self.taskArray insertObject:self.inputTextField.text atIndex:self.taskArray.count];
        [self.taskTableView reloadData];
        self.inputTextField.text = nil;
        [self.inputTextField resignFirstResponder];
    }
}

#pragma mark - 保存数据到CoreData;
- (void) saveToCoreData:(NSString *)taskName{
    
    NSManagedObjectContext *context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSManagedObject *row = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
    [row setValue:taskName forKey:@"taskname"];
    [context save:nil];
    NSLog(@"已保存到数据库");
}

@end
