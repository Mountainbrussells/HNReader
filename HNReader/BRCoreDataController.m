//
//  BRCoreDataController.m
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import "BRCoreDataController.h"

#import <CoreData/CoreData.h>

@interface BRCoreDataController ()

@property (strong, nonatomic) BRPersistenceController *persistencController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation BRCoreDataController

- (id)initWithPersistenceController:(BRPersistenceController *)persistenceController
{
    self = [super init];
    self.persistencController = persistenceController;
    self.managedObjectContext = self.persistencController.managedObjectContext;
    return self;
}

- (void)saveNewsStoryWithTitle:(NSString *)title andURL:(NSString *)url
{
    NewsStory *story = (NewsStory *)[NSEntityDescription insertNewObjectForEntityForName:@"NewsStory" inManagedObjectContext:self.managedObjectContext];
    story.title = title;
    story.urlString = url;
    

    
    [self.persistencController save];
}

- (NSArray *)getSavedNews;
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"NewsStory" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
//    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:NO];
//    NSArray *sort = [NSArray arrayWithObject:sortDescriptor];
//    fetchRequest.sortDescriptors = sort;
    NSError *error;
    NSArray *fetchedStories;
    
    fetchedStories = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    
    if (fetchedStories.count > 0) {
        return fetchedStories;
    }
    return nil;
    
}

@end
