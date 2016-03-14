// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to NewsStory.h instead.

#import <CoreData/CoreData.h>

extern const struct NewsStoryAttributes {
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *urlString;
	__unsafe_unretained NSString *uuid;
} NewsStoryAttributes;

@interface NewsStoryID : NSManagedObjectID {}
@end

@interface _NewsStory : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) NewsStoryID* objectID;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* urlString;

//- (BOOL)validateUrlString:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* uuid;

//- (BOOL)validateUuid:(id*)value_ error:(NSError**)error_;

@end

@interface _NewsStory (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSString*)primitiveUrlString;
- (void)setPrimitiveUrlString:(NSString*)value;

- (NSString*)primitiveUuid;
- (void)setPrimitiveUuid:(NSString*)value;

@end
