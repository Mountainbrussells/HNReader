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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
