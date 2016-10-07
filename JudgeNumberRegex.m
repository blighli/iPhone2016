#import "JudgeNumberRegex.h"

@implementation JudgeNumberRegex

- (BOOL) isNumber:(NSString*)str{
    NSString *numberRegex = @"^[0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (isMatch) {
        return true;
    } else {
        return false;
    }
}

@end
