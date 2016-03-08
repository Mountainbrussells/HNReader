//
//  BRSeviceController.m
//  HNReader
//
//  Created by Ben Russell on 3/8/16.
//  Copyright © 2016 Ben Russell. All rights reserved.
//

#import "BRSeviceController.h"

static NSString *const kBaseHackerNewsAPIURL = @"https://hacker-news.firebaseio.com/v0/";
static NSString *const kHackerNewsNewStoriesVenue = @"newstories.json?print=pretty";

@implementation BRSeviceController

- (void) getCurrentStoriesWithCompletion:(void (^)(NSDictionary *, NSError *))completion
{
    NSString *urlString = kBaseHackerNewsAPIURL;
    urlString = [urlString stringByAppendingString:kHackerNewsNewStoriesVenue];
    
    NSURL *hackerNewsURL = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *hackerNewsRequest = [[NSMutableURLRequest alloc] initWithURL:hackerNewsURL];
    [hackerNewsRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:hackerNewsRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            NSLog(@"Request Response:%@", response);

        }
        
        if (data) {
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"ResponseDictionary content: %@", responseDictionary);
            if (completion) {
                completion(responseDictionary, nil);
            }
        }
        
        if (error) {
            NSLog(@"RequestError:%@", error);
            if (completion) {
                completion (nil, error);
            }
        }
    }];
    
    [task resume];
    
}

@end
