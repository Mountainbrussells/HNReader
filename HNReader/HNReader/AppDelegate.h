//
//  AppDelegate.h
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@class BRPersistenceController;
@class BRCoreDataController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, readonly) BRPersistenceController *persistenceController;
@property (strong, readonly) BRCoreDataController *coreDataController;


@end

