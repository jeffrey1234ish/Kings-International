//
//  GridCell.h
//  Kings International
//
//  Created by Andrei Chan on 29/1/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCellGradientView.h"

@interface GridCell : UICollectionViewCell

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UIImageView *gradientView;

@end
