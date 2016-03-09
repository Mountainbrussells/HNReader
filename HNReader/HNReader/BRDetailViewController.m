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
@property (strong, nonatomic) NSString *storyURL;
@property (strong, nonatomic) NSString *storyTitle;
@end

@implementation BRDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [spinner setFrame:CGRectMake(0, 0, 100, 100)];
    spinner.transform = CGAffineTransformMakeScale(2, 2);
    [spinner setColor:[UIColor darkGrayColor]];
    [self.view addSubview:spinner];
    [spinner setCenter:CGPointMake(self.view.center.x, 150)];
    [self.view bringSubviewToFront:spinner];
    [spinner startAnimating];
    
    [self.serviceController getStoryNumber:self.storyNumber withCompletion:^(NSDictionary *storyDetails, NSError *error) {
        NSString *storyURL = storyDetails[@"url"];
        self.storyURL = storyURL;
        NSString *storyTitle = storyDetails[@"title"];
        self.storyTitle = storyTitle;
        NSURL *url = [NSURL URLWithString:storyURL];
        NSURLRequest *storyRequest = [NSURLRequest requestWithURL:url];
        
        [self.webView loadRequest:storyRequest];
        [spinner stopAnimating];
    }];
}

- (IBAction)shareButton:(id)sender {
    if (self.storyURL) {
        NSArray *itemsArray = [NSArray arrayWithObject:self.storyURL];
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsArray applicationActivities:nil];
        [self presentViewController:activityVC animated:YES completion:nil];
    }
    
    
}
- (IBAction)saveButton:(id)sender {
    [self.coreDataController saveNewsStoryWithTitle:self.storyTitle andURL:self.storyURL];
}


@end
