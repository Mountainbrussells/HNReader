//
//  BRDetailViewController.m
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import "BRDetailViewController.h"

@interface BRDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation BRDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.serviceController getStoryNumber:self.storyNumber withCompletion:^(NSDictionary *storyDetails, NSError *error) {
        NSString *storyURL = storyDetails[@"url"];
        NSURL *url = [NSURL URLWithString:storyURL];
        NSURLRequest *storyRequest = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:storyRequest];
    }];
    
    
}

- (IBAction)shareButton:(id)sender {
}
- (IBAction)saveButton:(id)sender {
}


@end
