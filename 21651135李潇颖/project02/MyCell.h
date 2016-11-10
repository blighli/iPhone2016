//
//  MyCell.h
//  MyCalendar
//
//

#import <UIKit/UIKit.h>

@interface MyCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *myText;

-(void)setText:(NSString *)srt;

@end
