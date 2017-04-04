//
//  SchoolMapView.m
//  Kings International
//
//  Created by Andrei Chan on 25/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "SchoolMapView.h"

@interface SchoolMapView ()

@end

@implementation SchoolMapView

@synthesize imageView=_imageView, delegate=_delegate;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithLocations:(NSArray *) locations {
    self = [super init];
    if (self != nil) {
        UIImage *schoolMap = [UIImage imageNamed:@"SchoolMap.png"];
        
        CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
        CGFloat screenImageRatio = screenHeight/schoolMap.size.height;
        
        CGFloat imageViewWidth = schoolMap.size.width*screenImageRatio;
        CGFloat imageViewHeight = screenHeight;
        
        _imageView = [[UIImageView alloc] initWithImage:schoolMap];
        _imageView.frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), .size=CGSizeMake(imageViewWidth, imageViewHeight)};
        
        [self addSubview:_imageView];
        
        self.frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), .size=CGSizeMake(imageViewWidth, imageViewHeight)};
        
        int i = 1;
        for (NSDictionary *locationDict in locations) {
            CGFloat x = [[locationDict objectForKey:@"x"] floatValue];
            CGFloat y = [[locationDict objectForKey:@"y"] floatValue];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = CGRectMake(x-10, y-10, 20, 20);
            button.tag = i;
            [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            
            i++;
        }
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
        tapRecognizer.numberOfTouchesRequired = 1;
        tapRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapRecognizer];
    }
    return self;
}

- (void) viewTapped {
    if ([_delegate respondsToSelector:@selector(schoolMapViewDidTapAtLocation:)]) {
        UITapGestureRecognizer *tapRecognizer = self.gestureRecognizers[0];
        [_delegate schoolMapViewDidTapAtLocation:[tapRecognizer locationInView:self]];
    }
}

- (void) buttonTouched:(UIButton *) buttonTapped {
    if ([_delegate respondsToSelector:@selector(schoolMapViewDidTouchButton:)]) {
        [_delegate schoolMapViewDidTouchButton:buttonTapped.tag];
    }
}

@end
