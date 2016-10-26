//
//  CJAppDelegate.m
//  MyTaskList
//
//  Created by Chanjun2016 on 16/10/26.
//  Copyright © 2016年 Chanjun2016. All rights reserved.
//

#import "CJAppDelegate.h"
#import "ViewController.h"

NSString *docPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(
                                                            NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0]
            stringByAppendingPathComponent:@"data.txt"];
}

@implementation CJAppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
    if (plist) {
        tasks = [plist mutableCopy];
    } else {
        tasks = [[NSMutableArray alloc] init];
    }
    
    CGRect windowFrame= [[UIScreen mainScreen] bounds];
    UIWindow *window = [[UIWindow alloc] initWithFrame:windowFrame];
    [self setWindow:window];
    
    _window.rootViewController = [[ViewController alloc] init];
    
    CGRect tableFrame = CGRectMake(0, 80, 320, 380);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);

    taskTable = [[UITableView alloc] initWithFrame:tableFrame
                                             style:UITableViewStylePlain];
    [taskTable setSeparatorStyle: UITableViewCellSeparatorStyleNone];
    
    taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    [taskField setBorderStyle:UITextBorderStyleRoundedRect];
    [taskField setPlaceholder:@"Type a task, tap Insert"];
    
    insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [insertButton setFrame:buttonFrame];
    [insertButton setTitle:@"Insert" forState:UIControlStateNormal];

    [insertButton addTarget:self
                     action:@selector(addTask:)
           forControlEvents:UIControlEventTouchUpInside];
    
    [[self window].rootViewController.view addSubview:taskTable];
    [[self window].rootViewController.view addSubview:taskField];
    [[self window].rootViewController.view addSubview:insertButton];

    [[self window] setBackgroundColor: [UIColor whiteColor]];
    [[self window] makeKeyAndVisible];
    
    [taskField setEnabled:YES];
    
    [taskTable setDataSource:self];
    
    [taskTable setDelegate:self];
    
//    [taskTable addGestureRecognizer:[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap:)]];
    
    return YES;
}

- (void)applicationDidEnterBackground: (UIApplication *) application
{
    [tasks writeToFile:docPath() atomically:YES];
}

- (void)addTask: (id)sender{
    NSString *text = [taskField text];
    if ([text  isEqualToString:@""]) {
        return;
    }
    [tasks addObject: text];
    [taskTable reloadData];
    [taskField setText:@""];
    [taskField resignFirstResponder]; 
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell ) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:@"Cell"];
    }
    NSString *item = [tasks objectAtIndex: [indexPath row]];
    
    [[cell  textLabel] setText:item];
    [cell addGestureRecognizer:[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap:)]];
    
    return cell ;
}


- (void)longTap:(UILongPressGestureRecognizer *)gestureRecognizer
{
    CGPoint tmpPointTouch = [gestureRecognizer locationInView:taskTable];
    if (gestureRecognizer.state ==UIGestureRecognizerStateBegan) {
        NSIndexPath *indexPath = [taskTable indexPathForRowAtPoint:tmpPointTouch];
        if (indexPath == nil) {
            NSLog(@"not tableView");
        }else{
            [tasks removeObjectAtIndex: [indexPath row]];
            [taskTable reloadData];
        }
    }
}

@end
