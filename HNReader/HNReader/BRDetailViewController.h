//
//  BRDetailViewController.h
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRSeviceController.h"
#import "BRCoreDataController.h"

@interface BRDetailViewController : UIViewController

@property NSString *storyNumber;

@property BRSeviceController *serviceController;
@property BRCoreDataController *coreDataController;

@end
