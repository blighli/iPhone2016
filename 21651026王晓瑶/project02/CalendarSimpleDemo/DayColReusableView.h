//
//  DayColReusableView.h
//
//


#import <UIKit/UIKit.h>

@interface DayColReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;


- (void)updateTimer:(NSArray*)array;
@end
