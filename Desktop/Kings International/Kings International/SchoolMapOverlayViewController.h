//
//  SchoolMapOverlayViewController.h
//  Kings International
//
//  Created by Andrei Chan on 25/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchoolMapOverlayViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) NSDictionary *configuration;

@end
