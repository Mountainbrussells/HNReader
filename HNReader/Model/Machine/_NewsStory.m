// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to NewsStory.m instead.

#import "_NewsStory.h"

const struct NewsStoryAttributes NewsStoryAttributes = {
	.title = @"title",
	.urlString = @"urlString",
	.uuid = @"uuid",
};

@implementation NewsStoryID
@end

@implementation _NewsStory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"NewsStory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"NewsStory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"NewsStory" inManagedObjectContext:moc_];
}

- (NewsStoryID*)objectID {
	return (NewsStoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic title;

@dynamic urlString;

@dynamic uuid;

@end

