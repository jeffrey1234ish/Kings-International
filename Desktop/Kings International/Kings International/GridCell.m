//
//  GridCell.m
//  Kings International
//
//  Created by Andrei Chan on 29/1/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "GridCell.h"

@implementation GridCell {
    CGFloat _shadowWidth;
}

@synthesize label, gradientView;

- (void)layoutSubviews
{
    [super layoutSubviews];
    /*
    CGRect bounds = self.bounds;
    if (_shadowWidth != bounds.size.width)
    {
        if (_shadowWidth == 0)
        {
            [self.layer setMasksToBounds:NO ];
            [self.layer setShadowColor:[[UIColor blackColor ] CGColor ] ];
            [self.layer setShadowOpacity:0.5 ];
            [self.layer setShadowRadius:5.0 ];
            [self.layer setShadowOffset:CGSizeMake( 0 , 0 ) ];
            self.layer.cornerRadius = 5.0;
        }
        [self.layer setShadowPath:[[UIBezierPath bezierPathWithRect:bounds ] CGPath ] ];
        _shadowWidth = bounds.size.width;
    }*/
}


@end
