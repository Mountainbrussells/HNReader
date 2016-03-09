//
//  SecondViewController.h
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRPersistenceController.h"
#import "BRCoreDataController.h"

@interface SecondViewController : UIViewController

@property (nonatomic, strong) BRPersistenceController *persistenceController;
@property (nonatomic, strong) BRCoreDataController *coreDataController;


@end

