//
//  KingsWebViewController.m
//  King's Ely International
//
//  Created by Andrei Chan on 4/10/14.
//  Copyright (c) 2014年 Andrei Chan. All rights reserved.
//

#import "KingsWebViewController.h"

@implementation KingsWebViewController

@synthesize overLay, webView;

-(void) viewDidLoad {

    webView.delegate = self;
    
    if (url != nil) {
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
}

-(void) configureViewControllerWithURL:(NSURL *) URL {
    url = URL;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    overLay.hidden = YES;
}

@end
