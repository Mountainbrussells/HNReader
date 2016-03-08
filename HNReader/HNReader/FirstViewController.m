//
//  FirstViewController.m
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import "FirstViewController.h"
#import "BRSeviceController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;
@property (strong, nonatomic) BRSeviceController *serviceController;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.serviceController = [[BRSeviceController alloc] init];
    
    [self.serviceController getCurrentStoriesWithCompletion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
