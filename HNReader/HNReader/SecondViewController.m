//
//  SecondViewController.m
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import "SecondViewController.h"
#import "NewsStory+CoreDataProperties.h"

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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



@end
