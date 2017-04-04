//
//  SchoolMapViewController.m
//  Kings International
//
//  Created by Andrei Chan on 21/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "SchoolMapViewController.h"

#define startingOffset CGPointMake(150, 150)

@interface SchoolMapViewController () {
    NSMutableArray *arrayOfLocations;
    
    TransitionController *transitionController;
}

@property (nonatomic, retain) SchoolMapOverlayViewController *overlayViewController;
@property (nonatomic, retain) NSMutableArray *mapData;
@property (nonatomic, retain) UIButton *backButton;

@end

@implementation SchoolMapViewController

@synthesize scrollView=_scrollView, schoolMapView=_schoolMapView, prototypeOverlayView=_prototypeOverlayView, mapData=_mapData, overlayViewController=_overlayViewController, backButton=_backButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    transitionController = [[TransitionController alloc] init];

    [self fetchingJSONData];
    [self setUpView];
    
    [_scrollView setContentOffset:startingOffset];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleLightContent];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault];
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}

#pragma helper functions
- (void) setUpView {
    _schoolMapView = [[SchoolMapView alloc] initWithLocations:[arrayOfLocations mutableCopy]];
    _schoolMapView.delegate = self;
    [_scrollView addSubview:_schoolMapView];
    
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.minimumZoomScale = 1.0;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    _prototypeOverlayView = [SchoolMapOverlayView new];
    _prototypeOverlayView.delegate = self;
    
    _scrollView.contentSize = CGSizeMake(_schoolMapView.frame.size.width, _schoolMapView.frame.size.height);
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, _prototypeOverlayView.frame.size.height, 0);
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"buttonGradient.png"]];
    [_backButton addTarget:self action:@selector(_backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    _backButton.frame = CGRectMake(25, 25, 30, 30);
    
    CALayer *layer = _backButton.layer;
    layer.shadowOffset = CGSizeMake(0.0, 0.0);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowOpacity = 0.5;
    layer.shadowRadius = 2.0;
    
    [self.view addSubview:_backButton];
    
    [self.view addSubview:_prototypeOverlayView];
}

- (void) fetchingJSONData {
    arrayOfLocations = [NSMutableArray array];
    NSURL *jsonDataUrl = [[NSBundle mainBundle] URLForResource:@"location" withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:jsonDataUrl];
    
    NSError *error;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (!error) {
        _mapData = [NSMutableArray array];
        for (NSDictionary *locationDict in [jsonData objectForKey:@"locations"]) {
            [_mapData addObject:locationDict];
            [arrayOfLocations addObject:[locationDict objectForKey:@"coordinateInView"]];
        }
    }
    
}

- (void) _backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

# pragma UIScrollViwDelegate
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _schoolMapView;
}

#pragma SchoolMapOverlayViewDelegate
- (void) schoolMapOverlayViewDidTap {
    [self performSegueWithIdentifier:@"toOverlayView" sender:nil];
}

#pragma SchoolMapViewDelegate
- (void) schoolMapViewDidTapAtLocation:(CGPoint)location {
    /*CGRect scrollViewFrame = _scrollView.frame;
    
    [_scrollView scrollRectToVisible:CGRectMake(location.x-(scrollViewFrame.size.width/2), location.y-(scrollViewFrame.size.height/2), scrollViewFrame.size.width, scrollViewFrame.size.height) animated:YES];*/
    
   NSLog(@"%@", NSStringFromCGPoint(location));
    
    /*CGFloat radius = 10.0;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(location.x-radius, location.y-radius, radius*2, radius*2)];
    view.backgroundColor = [UIColor redColor];
    CALayer *layer = view.layer;
    layer.cornerRadius = radius;
    
    [_schoolMapView addSubview:view];*/
    
}

- (void) schoolMapViewDidTouchButton:(NSUInteger)buttonNumber {
    NSDictionary *locationDict = [_mapData objectAtIndex:buttonNumber-1];
    NSString *nameOfLocation = [locationDict objectForKey:@"name"];
    
    [_prototypeOverlayView changeNameTo:nameOfLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void) setUpOverlayView {
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    SchoolMapOverlayViewController *viewController = [segue destinationViewController];
    viewController.transitioningDelegate = transitionController;
    
    viewController.configuration = @{@"name":self.prototypeOverlayView.nameLabel.text, @"description":@"hahahaha"};
}



@end
