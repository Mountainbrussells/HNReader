//
//  FirstViewController.m
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import "FirstViewController.h"
#import "BRSeviceController.h"
#import "BRDetailViewController.h"

@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;
@property (strong, nonatomic) BRSeviceController *serviceController;
@property (strong, nonatomic) NSMutableArray *storyNumberArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.serviceController = [[BRSeviceController alloc] init];
    self.newsTableView.delegate = self;
    self.newsTableView.dataSource = self;
    self.storyNumberArray = [[NSMutableArray alloc] init];
    self.title = @"HNReader";
    
    
    [self.serviceController getCurrentStoriesWithCompletion:^(NSArray *newsStories, NSError *error) {
        if (newsStories) {
           self.storyNumberArray = [NSMutableArray arrayWithArray:newsStories];

            
            [self.newsTableView reloadData];
        }
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegates

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.storyNumberArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (self.storyNumberArray.count > 0) {
        NSString *storyNumber = self.storyNumberArray[indexPath.row];
        [self.serviceController getStoryNumber:storyNumber withCompletion:^(NSDictionary *storyDetails, NSError *error) {
            NSString *title = storyDetails[@"title"];
            cell.textLabel.text = title;
        }];
        return cell;
    }
    
    
    return cell;
}

#pragma mark - Seque preperations

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.newsTableView indexPathForSelectedRow];
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        BRDetailViewController *detailVC = [segue destinationViewController];
        detailVC.storyNumber = self.storyNumberArray[indexPath.row];
        detailVC.serviceController = self.serviceController;
        detailVC.coreDataController = self.coreDataController;
    }
}

#pragma mark - Refresh Control

- (IBAction)refreshButton:(id)sender {
    // Start Spinner
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [spinner setFrame:CGRectMake(0, 0, 100, 100)];
    spinner.transform = CGAffineTransformMakeScale(2, 2);
    [spinner setColor:[UIColor darkGrayColor]];
    [self.view addSubview:spinner];
    [spinner setCenter:CGPointMake(self.view.center.x, 150)];
    [self.view bringSubviewToFront:spinner];
    [spinner startAnimating];
    
    // Refresh storyNumberArray
    [self.serviceController getCurrentStoriesWithCompletion:^(NSArray *newsStories, NSError *error) {
        if (newsStories) {
            self.storyNumberArray = [NSMutableArray arrayWithArray:newsStories];
            
            [spinner stopAnimating];
            
            
            [self.newsTableView reloadData];
        }
    }];
}


@end
