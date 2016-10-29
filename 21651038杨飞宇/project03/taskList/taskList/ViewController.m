//
//  ViewController.m
//  taskList
//
//  Created by yangfeiyu on 2016/10/26.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createMyView];
    _arrayData = [[NSMutableArray alloc] init];
    
    NSArray* tasksArray = [self getFileContent];
    for (NSString* strTmp in tasksArray) {
        NSMutableArray* small = [[NSMutableArray alloc] init];
        [small addObject:strTmp];
        [_arrayData addObject:small];
        NSLog(@"%@",strTmp);
    }
    
}

-(void) createMyView{
    
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    _tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [_taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [_taskField setPlaceholder:@"Type a task, tap Insert"];
    
    
    _insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_insertButton setFrame:buttonFrame];
    [_insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    [_insertButton addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_tableView];
    [self.view addSubview:_taskField];
    [self.view addSubview:_insertButton];
}



-(void) pressBtn{
    NSLog(@"btnnnnn presssss");
    NSLog(@"%@",_taskField.text);
    NSMutableArray* small = [[NSMutableArray alloc] init];
    [small addObject:_taskField.text];
    [_arrayData addObject:small];
    NSLog(@"%@",_arrayData);
    [_tableView reloadData];
    [self.view endEditing:YES];
    //[self viewDidLoad];
    
    

}

-(NSArray*) getFileContent{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* thepath = [paths lastObject];
    thepath = [thepath stringByAppendingPathComponent:@"data1.txt"];
    //NSLog(@"目录：%@", thepath);
    NSFileManager* fm = [NSFileManager defaultManager];
    NSData* data = [[NSData alloc] init];
    data = [fm contentsAtPath:thepath];
    //NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSString* ss = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"the-----：%@", ss);
    NSArray* aa = [ss componentsSeparatedByString:@"\n"];
    //NSLog(@"ok-----：%@", aa);
    return aa;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"the row is %ld",_arrayData.count);
    return _arrayData.count;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger num = [[_arrayData objectAtIndex:section] count];
    return num;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"row----%ld  col----%ld",indexPath.section,indexPath.row);
    NSString* str = @"cell";
    UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
