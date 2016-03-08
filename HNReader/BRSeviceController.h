//
//  BRSeviceController.h
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BRSeviceController : NSObject

// return current list of stories
- (void) getCurrentStoriesWithCompletion:(void(^)(NSDictionary *newsStories, NSError *error))completion;

// return idividual stories Title and URL
- (void) getStoryNumber: (NSString *)numberString withCompletion: (void(^)(NSDictionary *storyDetails, NSError *error))completion;


@end
