//
//  TDTaskHeader.m
//  ToDoList
//
//  Created by soulghost on 24/10/2016.
//  Copyright © 2016 soulghost. All rights reserved.
//

#import "TDTaskHeader.h"

@interface TDTaskHeader ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (nonatomic, copy) TDTaskHeaderCallback callback;



@end

@implementation TDTaskHeader

+ (instancetype)header {
    return [[[NSBundle mainBundle] loadNibNamed:@"TDTaskHeader" owner:nil options:nil] firstObject];
}

- (void)setOnClickCallback:(TDTaskHeaderCallback)callback {
    self.callback = callback;
}

- (IBAction)addBtnClick:(id)sender {
    if (self.callback) {
        self.callback(self.inputField.text);
    }
}

@end
