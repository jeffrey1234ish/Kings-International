//
//  MainCollectionViewDataSource.m
//  Kings International
//
//  Created by Andrei Chan on 11/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "MainCollectionViewDataSource.h"

@implementation MainCollectionViewDataSource {
    NSArray *items;
}

@synthesize delegate=_delegate, collectionView=_collectionView;

- (id) initWithCollectionView:(UICollectionView *) collectionView {
    self = [super init];
    if (self != nil) {
        _collectionView = collectionView;
        
        items = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12];
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return items.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [_delegate configureCellAtIndexPath:indexPath CollectionView:_collectionView];
}

@end
