//
//  SchoolMapOverlayViewController.m
//  Kings International
//
//  Created by Andrei Chan on 25/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "SchoolMapOverlayViewController.h"

@interface SchoolMapOverlayViewController ()

@end

@implementation SchoolMapOverlayViewController

@synthesize backButton=_backButton, imageView=_imageView, descriptionLabel=_descriptionLabel, locationLabel=_locationLabel, configuration=_configuration;

- (void) updateView {
    NSString *nameOfLocation = [_configuration objectForKey:@"name"];
    NSString *description = [_configuration objectForKey:@"description"];
    
    _locationLabel.text = nameOfLocation;
}

- (instancetype) init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_backButton addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:_descriptionLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineHeightMultiple:10.5f];
    [paragraphStyle setLineSpacing:2.5f];
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSRangeFromString(_descriptionLabel.text)];
    
    [_descriptionLabel setAttributedText:attributedText];
}

- (void)dismissView {
    [self dismissViewControllerAnimated:YES completion: nil];
}

- (IBAction) unwindViewController:(UIStoryboardSegue *) sender {
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateView];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
