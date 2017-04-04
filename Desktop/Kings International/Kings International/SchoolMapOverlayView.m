//
//  SchoolMapOverlayView.m
//  Kings International
//
//  Created by Andrei Chan on 25/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "SchoolMapOverlayView.h"

@interface SchoolMapOverlayView ()

@end

@implementation SchoolMapOverlayView

@synthesize delegate=_delegate, imageView=_imageView, nameLabel=_nameLabel;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma helper function
- (void) createShadow {
    CALayer *layer = self.layer;
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowOffset = CGSizeMake(0, -1.0);
    layer.shadowOpacity = 0.5;
    layer.shadowRadius = 2.0;
}

#pragma init
- (instancetype) init {
    self = [super init];
    if (self != nil) {
        
        CGFloat height = 100.0f;
        CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
        CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
        
        self.frame = CGRectMake(0, screenHeight-height, screenWidth, height);
        self.backgroundColor = [UIColor whiteColor];
        [self createShadow];
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth-height, 0, height, height)];
        self.imageView.backgroundColor = [UIColor blueColor];
        [self addSubview:self.imageView];
       
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 250, 30)];
        _nameLabel.text = @"School House";
        [self addSubview:_nameLabel];
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
        [self addGestureRecognizer:tapRecognizer];
    }
    return self;
}


- (void) viewTapped {
    if ([_delegate respondsToSelector:@selector(schoolMapOverlayViewDidTap)]) {
        [_delegate schoolMapOverlayViewDidTap];
    }
}

- (void) changeNameTo:(NSString *)name {
    _nameLabel.text = name;
}

@end
