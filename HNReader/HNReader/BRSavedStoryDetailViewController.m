//
//  BRSavedStoryDetailViewController.m
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import "BRSavedStoryDetailViewController.h"

@interface BRSavedStoryDetailViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation BRSavedStoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *storyRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:storyRequest];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
