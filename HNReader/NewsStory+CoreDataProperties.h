//
//  NewsStory+CoreDataProperties.h
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NewsStory.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsStory (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *urlString;

@end

NS_ASSUME_NONNULL_END
