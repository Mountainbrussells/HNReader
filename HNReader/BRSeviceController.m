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
static NSString *const kHackerNewsItemVenue = @"item/";
static NSString *const kHackerNewsSuffix = @".json?print=pretty";

@implementation BRSeviceController

- (void) getCurrentStoriesWithCompletion:(void (^)(NSArray *, NSError *))completion
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
            NSMutableArray *dictArray = [[NSMutableArray alloc] init];
            for (NSString *number in responseDictionary) {
                [dictArray addObject:number];
            }
            
            NSArray *sortedArray = [dictArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
                
                if ([obj1 integerValue] > [obj2 integerValue]) {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                
                if ([obj1 integerValue] < [obj2 integerValue]) {
                    return (NSComparisonResult)NSOrderedDescending;
                }
                return (NSComparisonResult)NSOrderedSame;
            }];
            
            NSArray *returnArray = [NSArray arrayWithArray:sortedArray];
            
            NSLog(@"%@", returnArray);

            
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(returnArray, nil);
                });
                
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

- (void) getStoryNumber:(NSString *)numberString withCompletion:(void (^)(NSDictionary *, NSError *))completion
{
    NSString *urlString = kBaseHackerNewsAPIURL;
    urlString = [urlString stringByAppendingString:kHackerNewsItemVenue];
    NSString *suffixString = [NSString stringWithFormat:@"%@%@", numberString, kHackerNewsSuffix];
    urlString = [urlString stringByAppendingString:suffixString];
    
    NSURL *hackerNewsURL = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *hackerNewsRequest = [[NSMutableURLRequest alloc] initWithURL:hackerNewsURL];
    [hackerNewsRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:hackerNewsRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (response) {
            // NSLog(@"Request Response:%@", response);
            
        }
        
        if (data) {
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            // NSLog(@"ResponseDictionary content: %@", responseDictionary);
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(responseDictionary, nil);
                });
                
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
