//
//  MainCollectionViewController.h
//  Kings International
//
//  Created by Andrei Chan on 28/1/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridCell.h"
#import "RAMCollectionViewFlemishBondLayout.h"
#import "KingsWebViewController.h"
#import "MapViewController.h"

@interface MainCollectionViewController : UICollectionViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, RAMCollectionViewFlemishBondLayoutDelegate>

@property (nonatomic, strong) NSDictionary *items;

@end
