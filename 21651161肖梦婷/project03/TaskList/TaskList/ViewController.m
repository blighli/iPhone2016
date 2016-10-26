//
//  ViewController.m
//  TaskList
//
//  Created by xmt on 16/10/23.
//  Copyright © 2016年 xmt. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UITableView *taskTableView;

@property(strong,nonatomic) NSMutableArray *taskArray;
@property(strong,nonatomic) NSArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //加载数据库文件；
    NSManagedObjectContext *context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSFetchRequest *fetchData = [[NSFetchRequest alloc] initWithEntityName:@"Task"];
    self.arr = [context executeFetchRequest:fetchData error:nil];
    self.taskArray = [[NSMutableArray alloc] initWithArray:[self.arr valueForKey:@"taskname"]];
}

//cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.taskArray.count;
}

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
    
    //如果输入为空则不添加；
    if ([inputStr  isEqual: @""]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入的内容不能为空" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:true completion:nil];
    } else {
        
        //点击按钮，就把该数据存储到CoreData中
        [self saveToCoreData:inputStr];
        //把文本存储到taskArray数组中
        [self.taskArray insertObject:self.inputTextField.text atIndex:self.taskArray.count];
        [self.taskTableView reloadData];
        //清空输入框
        self.inputTextField.text = nil;
        //隐藏软键盘
        [self.inputTextField resignFirstResponder];
    }
}

//保存数据到CoreData
- (void) saveToCoreData:(NSString *)taskName{
    
    NSManagedObjectContext *context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSManagedObject *row = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
    [row setValue:taskName forKey:@"taskname"];
    [context save:nil];
    NSLog(@"已保存到数据库");
}

//隐藏软键盘（滚动时）
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.inputTextField resignFirstResponder];
}

@end
