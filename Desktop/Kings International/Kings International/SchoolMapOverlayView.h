//
//  SchoolMapOverlayView.h
//  Kings International
//
//  Created by Andrei Chan on 25/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SchoolMapOverlayViewDelegate <NSObject>

@optional
- (void) schoolMapOverlayViewDidTap;

@end

@interface SchoolMapOverlayView : UIView

@property (nonatomic, weak) id<SchoolMapOverlayViewDelegate> delegate;

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *nameLabel;

- (void) changeNameTo:(NSString *) name;

@end
