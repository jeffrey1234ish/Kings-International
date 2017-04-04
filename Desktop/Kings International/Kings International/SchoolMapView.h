//
//  SchoolMapView.h
//  Kings International
//
//  Created by Andrei Chan on 25/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SchoolMapViewDelegate <NSObject>

- (void) schoolMapViewDidTapAtLocation:(CGPoint) location;
- (void) schoolMapViewDidTouchButton:(NSUInteger) buttonNumber;

@end

@interface SchoolMapView : UIView

@property (nonatomic, weak) id<SchoolMapViewDelegate> delegate;

@property (nonatomic, retain) UIImageView *imageView;

- (instancetype) initWithLocations:(NSArray *) locations;

@end
