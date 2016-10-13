

#import <Foundation/Foundation.h>
#import "MyCal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDate *date = [NSDate date];
        NSUInteger unFlag = (NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday);

        NSDateComponents *compt = [calendar components:unFlag fromDate:date];
        NSUInteger month = [compt month];
        NSUInteger year = [compt year];
        MyCal *myCal = [[MyCal alloc] init];

        //处理命令行
        for (int i = 0; i < argc; i++)
            printf("%s ", argv[i]);
        printf("\n");
        @try {
            if (argc == 1) {
                [myCal showCalendarWithYear:year minMonth:month maxMonth:month andTimes:1];
            } else {
                NSException *exception = [NSException exceptionWithName:@"CommandException" reason:@"Command Error" userInfo:nil];
                if (argv[1][0] == '-') {
                    if (argv[1][1] == 'm' && argc == 3 && [myCal isLegal:argv[2]]) {
                        month = atoi(argv[2]);
                    } else {
                        @throw exception;
                    } if (![myCal isMonth:month]) {
                        @throw exception;
                    }
                    [myCal showCalendarWithYear:year minMonth:month maxMonth:month andTimes:1];
                } else {
                    for (int i = 1; i < argc; i++) {
                        if (![myCal isLegal:argv[i]]) {
                            @throw exception;
                        }
                    }
                    if (argc == 3) {
                        month = atoi(argv[1]);
                        if (![myCal isMonth:month]) {
                            @throw exception;
                        }
                        year = atoi(argv[2]);
                        [myCal showCalendarWithYear:year minMonth:month maxMonth:month andTimes:1];
                    } else if (argc == 2) {
                        year = atoi(argv[1]);
                        [myCal showCalendarWithYear:year minMonth:1 maxMonth:12 andTimes:3];
                    } else {
                        @throw exception;
                    }
                }
            }
        } @catch (NSException *exception) {
            NSLog(@"%@: parameter is illegal!", exception);
        } @finally {
        }
    }
    return 0;
}
