//
//  FirstViewController.m
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import "FirstViewController.h"
#import "BRSeviceController.h"

@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;
@property (strong, nonatomic) BRSeviceController *serviceController;
@property (strong, nonatomic) NSMutableArray *storyNumberArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.serviceController = [[BRSeviceController alloc] init];
    
    [self.serviceController getCurrentStoriesWithCompletion:^(NSDictionary *newsStories, NSError *error) {
        if (newsStories) {
            NSDictionary *dict = newsStories;
            
            self.storyNumberArray = [[NSMutableArray alloc] init];
            for (NSString *number in dict) {
                [self.storyNumberArray addObject:number];
            }
            
            
        }
    }];
    
    self.newsTableView.delegate = self;
    self.newsTableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
