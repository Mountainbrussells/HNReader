//
//  SecondViewController.m
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import "SecondViewController.h"
#import "NewsStory+CoreDataProperties.h"
#import "BRSavedStoryDetailViewController.h"

@interface SecondViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *savedNewsTableView;
@property (strong, nonatomic) NSArray *savedNewsArray;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.savedNewsArray = [self.coreDataController getSavedNews];
    self.savedNewsTableView.delegate = self;
    self.savedNewsTableView.dataSource = self;
    [self.savedNewsTableView reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.savedNewsArray = [self.coreDataController getSavedNews];
    self.savedNewsTableView.delegate = self;
    self.savedNewsTableView.dataSource = self;
    [self.savedNewsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.savedNewsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (self.savedNewsArray.count > 0) {
        NewsStory *story = self.savedNewsArray[indexPath.row];
        cell.textLabel.text = story.title;
        return cell;
    }
    
    
    return cell;
}

#pragma mark - Segue Preperation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.savedNewsTableView indexPathForSelectedRow];
    if ([[segue identifier] isEqualToString:@"savedDetailsSegue"]) {
        BRSavedStoryDetailViewController *detailVC = [segue destinationViewController];
        NewsStory *story = self.savedNewsArray[indexPath.row];
        detailVC.urlString = story.urlString;
        
    }
}

-(IBAction)prepareForUnwindFromSavedDetail:(UIStoryboardSegue *)segue {
}



@end
