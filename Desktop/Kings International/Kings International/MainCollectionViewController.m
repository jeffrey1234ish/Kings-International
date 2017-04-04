//
//  MainCollectionViewController.m
//  Kings International
//
//  Created by Andrei Chan on 28/1/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "MainCollectionViewController.h"
#import "CustomFlowLayout.h"
#import "CollectionViewCellGradientView.h"
#import "MainCollectionViewDataSource.h"

@interface MainCollectionViewController ()
{
    NSIndexPath *previousSelectedCell;
    UIView *vTestView;
}

@end

@implementation MainCollectionViewController

@synthesize items=_items;

static NSString * const reuseIdentifier = @"Cell";
static NSString * const mapSegueIdentifier = @"toMap";
static NSString * const webSegueIdentifier = @"toWeb";

- (void) setUp {
    //set the title of the page
    self.title = @"King's International";
    
    //setup UICollectionView
    [self.collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"HeaderView"];
    
    //setup collection view data source items
    self.items = @{@0:@"Map", @1:@"Latest Notice", @2:@"Useful Sites"};
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    //setting up the layout property
    //RAMCollectionViewFlemishBondLayout *layout = [[RAMCollectionViewFlemishBondLayout alloc] init];
    //UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CustomFlowLayout *layout = [[CustomFlowLayout alloc] init];
    self.collectionView.collectionViewLayout = layout;
    
    self.collectionView.dataSource = self;
    
    //setup bookmark view
    vTestView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width-40.0f,
                                                         0,
                                                         30.0f,
                                                         100.0f)];
    vTestView.backgroundColor = [UIColor blueColor];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUp];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
}

- (void) viewWillDisappear:(BOOL)animated {
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier  isEqual: @"toWeb"]) {
        //Configuring destination web view
        KingsWebViewController *kingsViewController = (KingsWebViewController *) segue.destinationViewController;
        switch (previousSelectedCell.row) {
            case 0:
                [kingsViewController configureViewControllerWithURL:[NSURL URLWithString:@"http://www.kingsely.org/"]];
                break;
                /*case 1:
                 [kingsViewController configureViewControllerWithURL:[NSURL URLWithString:@"https://maps.google.com/"]];
                 break;*/
            case 2:
                [kingsViewController configureViewControllerWithURL:[NSURL URLWithString:@"https://firefly.kings-ely.cambs.sch.uk/login/login.aspx?prelogin=https%3a%2f%2ffirefly.kings-ely.cambs.sch.uk%2f"]];
                break;
            default:
                break;
        }
    }
    else {
        //Configure destination map view
    }
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(100, 100);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return ([UIScreen mainScreen].bounds.size.width-200)/2;
}


#pragma mark <RAMCollectionViewFlemishBondLayoutDelegate>

- (RAMCollectionViewFlemishBondLayoutGroupDirection)collectionView:(UICollectionView *)collectionView layout:(RAMCollectionViewFlemishBondLayout *)collectionViewLayout highlightedCellDirectionForGroup:(NSInteger)group atIndexPath:(NSIndexPath *)indexPath {
    return RAMCollectionViewFlemishBondLayoutGroupDirectionLeft;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.items count];
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *headView = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    
    if (headView==nil) {
        headView=[[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    }
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    label.text=[NSString stringWithFormat:@"Recipe Group #%li", indexPath.section + 1];
    [headView addSubview:label];

    headView.frame = CGRectMake(0, 0, self.collectionView.frame.size.width, 100);
    headView.backgroundColor = [UIColor blackColor];
    
    return headView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GridCell *cell = (GridCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //Cell Configuration
    //Creating and setting the background color of the cells acording to their order
    CGFloat hue = ((CGFloat)indexPath.item)/[collectionView numberOfItemsInSection:indexPath.section];
    UIColor *cellColor = [UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0];
    cell.contentView.backgroundColor = cellColor;
    //setup text of UILabel in Cell
    if ([_items objectForKey:[NSNumber numberWithInteger:indexPath.row]] != nil) {
        cell.label.text = [_items objectForKey:[NSNumber numberWithInteger:indexPath.row]];
    } else
        cell.label.text = @"HAHA";
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //Cache the selected location
    previousSelectedCell = indexPath;
    
    //present view controller according to the selected cell
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:mapSegueIdentifier sender:nil];
    } else {
        [self performSegueWithIdentifier:webSegueIdentifier sender:nil];
    }
    
    //little animation ;p
    /*CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [[collectionView cellForItemAtIndexPath:indexPath].layer addAnimation:animation forKey:@"shake"];*/
}

#pragma Trait Collection

- (void) traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
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
