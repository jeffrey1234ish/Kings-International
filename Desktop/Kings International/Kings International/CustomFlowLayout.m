//
//  CustomFlowLayout.m
//  Kings International
//
//  Created by Andrei Chan on 30/1/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout

- (void) prepareLayout {
    self.minimumInteritemSpacing = ([UIScreen mainScreen].bounds.size.width-200)/2;
    self.minimumLineSpacing = 15.0;
}

- (CGRect)cellRectForNonRowOneElementsWithX:(CGFloat)x Y:(CGFloat)y {
    
    return CGRectMake(x, y, (self.collectionViewContentSize.width/2), 100.0f);
    
}

- (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *answer = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    /*for(int i = 0; i < [answer count]; ++i) {
        UICollectionViewLayoutAttributes *currentLayoutAttributes = answer[i];
        switch (i) {
            case 0: {
                currentLayoutAttributes.frame = CGRectMake(0, currentLayoutAttributes.frame.origin.y, self.collectionViewContentSize.width, 100.0f);
                break;
            }
            case 1:
                break;
            default: {
                currentLayoutAttributes.frame = CGRectMake(currentLayoutAttributes.frame.origin.x, currentLayoutAttributes.frame.origin.y, (self.collectionViewContentSize.width/2), 100.0f);
                break;
            }
        }
    }*/
    
    int i = 0;
    for (UICollectionViewLayoutAttributes *currentLayoutAttributes in answer) {
        if (i % 2 ==0) {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x += 30;
            currentLayoutAttributes.frame = frame;
        }
        else {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x -= 30;
            currentLayoutAttributes.frame = frame;
        }
        i++;
    }
    
    
    return answer;
}

#pragma private method



@end
