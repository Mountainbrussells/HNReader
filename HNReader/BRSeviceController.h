//
//  BRSeviceController.h
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//
/*  This is the controller for all RESTful calls */

#import <Foundation/Foundation.h>



@interface BRSeviceController : NSObject

// return current list of stories
- (void) getCurrentStoriesWithCompletion:(void(^)(NSArray *newsStories, NSError *error))completion;

// return idividual stories Title and URL
- (void) getStoryNumber: (NSString *)numberString withCompletion: (void(^)(NSDictionary *storyDetails, NSError *error))completion;


@end
