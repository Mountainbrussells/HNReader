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
    [self setPersistenceController:[[BRPersistenceController alloc] initWithCallBack:nil]];
    self.coreDataController = [[BRCoreDataController alloc] initWithPersistenceController:self.persistenceController];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    FirstViewController *firstVC = [tabBarController.viewControllers objectAtIndex:0];
    firstVC.persistenceController = self.persistenceController;
    firstVC.coreDataController = self.coreDataController;
    
    SecondViewController *secondVC = [tabBarController.viewControllers objectAtIndex:1];
    secondVC.persistenceController = self.persistenceController;
    secondVC.coreDataController = self.coreDataController;
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[self persistenceController] save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[self persistenceController] save];

}

@end
