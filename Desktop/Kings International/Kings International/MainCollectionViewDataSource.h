//
//  MainCollectionViewDataSource.h
//  Kings International
//
//  Created by Andrei Chan on 11/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CollectionViewDataSourceDelegate;

@interface MainCollectionViewDataSource : NSObject <UICollectionViewDataSource>

@property (nonatomic, weak) id<CollectionViewDataSourceDelegate> delegate;
@property (nonatomic, retain) UICollectionView *collectionView;

- (id) initWithCollectionView:(UICollectionView *) collectionView;

@end

@protocol CollectionViewDataSourceDelegate <NSObject>

@required
- (UICollectionViewCell *) configureCellAtIndexPath:(NSIndexPath *) indexPath CollectionView:(UICollectionView *) collectionView;

@end