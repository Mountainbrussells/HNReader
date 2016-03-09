//
//  AppDelegate.m
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import "AppDelegate.h"

#import "BRPersistenceController.h"
#import "BRCoreDataController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"


@interface AppDelegate ()

@property (strong, readwrite) BRPersistenceController *persistenceController;
@property (strong, readwrite) BRCoreDataController *coreDataController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Set up Core Data
    [self setPersistenceController:[[BRPersistenceController alloc] initWithCallBack:nil]];
    self.coreDataController = [[BRCoreDataController alloc] initWithPersistenceController:self.persistenceController];
    
    // Pass on persistenceController and coreDataController
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    // I will use a navigation controller in the New News View Controller
    UINavigationController *navVCOne = [tabBarController.viewControllers objectAtIndex:0];
    FirstViewController *firstVC = [navVCOne.viewControllers objectAtIndex:0];
    firstVC.persistenceController = self.persistenceController;
    firstVC.coreDataController = self.coreDataController;
    
    // I will use an Unwind Segue in the Saved News View Controller
    SecondViewController *secondVC = [tabBarController.viewControllers objectAtIndex:1];
    secondVC.persistenceController = self.persistenceController;
    secondVC.coreDataController = self.coreDataController;
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[self persistenceController] save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[self persistenceController] save];

}

@end
