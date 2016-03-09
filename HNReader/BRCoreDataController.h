//
//  BRCoreDataController.h
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BRPersistenceController.h"
#import "NewsStory+CoreDataProperties.h"

@interface BRCoreDataController : NSObject

- (id)initWithPersistenceController:(BRPersistenceController *)persistenceController;

- (void)saveNewsStoryWithTitle:(NSString *)title andURL:(NSString *)url;

- (NSArray *)getSavedNews;

@end
