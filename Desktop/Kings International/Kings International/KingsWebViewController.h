//
//  KingsWebViewController.h
//  King's Ely International
//
//  Created by Andrei Chan on 4/10/14.
//  Copyright (c) 2014年 Andrei Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KingsWebViewController : UIViewController <UIWebViewDelegate> {
    NSURL *url;
}

@property (nonatomic, retain) IBOutlet UIView *overLay;
@property (nonatomic, retain) IBOutlet UIWebView * webView;

-(void) configureViewControllerWithURL:(NSURL *) URL;

@end
