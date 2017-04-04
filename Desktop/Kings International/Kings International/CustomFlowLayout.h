//
//  CustomFlowLayout.h
//  Kings International
//
//  Created by Andrei Chan on 30/1/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomFlowLayout : UICollectionViewFlowLayout

- (CGRect) cellRectForNonRowOneElementsWithX: (CGFloat)x Y:(CGFloat)y;

@end
