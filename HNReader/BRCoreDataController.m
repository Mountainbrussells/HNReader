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
@property (strong, nonatomic) NSManagedObjectContext *moc;

@end

@implementation BRCoreDataController

- (id)initWithPersistenceController:(BRPersistenceController *)persistenceController
{
    self = [super init];
    self.persistencController = persistenceController;
    self.moc = self.persistencController.managedObjectContext;
    return self;
}

@end
