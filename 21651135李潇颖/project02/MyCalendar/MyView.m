//
//  MyView.m
//  MyCalendar
//
//

#import "MyView.h"
#import "Tool.h"
#import "MyCell.h"
#import "MyHeader.h"


NSString *mycell = @"cell2";

@interface MyView ()

@end
static CGFloat const CellMargin = 1.0f;
static NSUInteger const DaysPerWeek = 7;
static int number = 1;
static int year = 2016;
static int month = 10;



@implementation MyView


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
//    NSLog([[NSString alloc] initWithFormat:@"%d",[Tool getYear]]);
//    NSLog([[NSString alloc] initWithFormat:@"%d",[Tool getMonth]]);
//    NSLog([[NSString alloc] initWithFormat:@"%d",[Tool getDay]]);
//    NSLog([[NSString alloc] initWithFormat:@"%d",[Tool getDaysOfMonth:[Tool getYear] withMonth:[Tool getMonth]]]);
//    NSLog([[NSString alloc] initWithFormat:@"%d",[Tool getWeekOfFirstDayOfMonth:[Tool getYear] withMonth:[Tool getMonth]]]);
    [self.view reloadInputViews];
}

- (IBAction)next:(id)sender {
    if (month < 12) {
        month += 1;
    }else{
        month = 1;
        year = year + 1;
    }
    NSLog(@"%d年%d月",year,month);
    [self.myCollectionView reloadData];
}

- (IBAction)last:(id)sender {
    if (month > 1) {
        month -= 1;
    }else{
        month = 12;
        year -= 1;
    }
    [self.myCollectionView reloadData];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

//返回section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 1;
}

//返回section中的cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return [Tool getDaysOfMonth:year withMonth:month] + [Tool getWeekOfFirstDayOfMonth:year withMonth:month];
}

//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell ;
    
//     Configure the cell
    if (indexPath.row < [Tool getWeekOfFirstDayOfMonth:year withMonth:month]) {
//        cell.myText.text = @"";
//        cell.backgroundColor = [UIColor clearColor];
//        cell.myText.backgroundColor = [UIColor clearColor];

        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellNil" forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:mycell forIndexPath:indexPath];
        cell.myText.text = [[NSString alloc] initWithFormat:@"%d",indexPath.row - [Tool getWeekOfFirstDayOfMonth:year withMonth:month] + 1];
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = 22;
        
        cell.myText.layer.masksToBounds = YES;
        cell.myText.layer.cornerRadius = 13;
    }
    
//    cell.mLabel.text = @"!!";
//    cell.backgroundColor = [UIColor redColor];
//    [cell setText:@"!!!"];
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
//返回cell的宽和高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger numberOfMaigin = 9;
    CGFloat with = floorf((collectionView.frame.size.width - CellMargin * numberOfMaigin) / DaysPerWeek);
    CGFloat height = with;
    
    return CGSizeMake(with, height);
}

//每行cell之间的间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return CellMargin;
}


//返回头尾
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        MyHeader *myHeader = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"myheader" forIndexPath:indexPath];
        
////        myHeader.myTitle.text = [[[NSString alloc] initWithFormat:@"%d",year]
//                                 stringByAppendingString:[NSString stringWithFormat:@"年%d月",month]];
        myHeader.myTitle.text = [[NSString alloc] initWithFormat:@"%d年%d月",year,month];
        
        return myHeader;
    }
    else
        return nil;
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
