//
//  CoreDataTool.m
//  ColorDiary
//
//  Created by apple on 16/5/17.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "CoreDataTool.h"
#import <CoreData/CoreData.h>
#import "Diary.h"

@interface CoreDataTool ()
//操作实际内容（操作持久层）,作用：插入数据，查询数据，删除数据
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//数据库所有表格或数据结构
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//相当于数据库的连接器
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end

@implementation CoreDataTool

#pragma mark - 单例

static id _instance;

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    if (_instance==nil) {
        @synchronized(self){
            if (_instance==nil) {
                _instance=[super allocWithZone:zone];
            }
        }
    }
    return _instance;
}

+(instancetype)sharedCoreDataTool{
    if (_instance==nil) {
        @synchronized(self){
            if (_instance==nil) {
                _instance=[[self alloc] init];
            }
        }
    }
    return _instance;
}

#pragma mark - 工具方法

-(void)cdinsertDate:(NSDate*)date text:(NSString*)text{
    //存储
    NSManagedObjectContext* context=self.managedObjectContext;
    Diary* diary=[NSEntityDescription insertNewObjectForEntityForName:@"Diary" inManagedObjectContext:context];
    diary.dcontent=text;
    diary.ddate=date;
    [self saveContext];
}
-(void)cdget{
    //查询
    NSManagedObjectContext* context=self.managedObjectContext;
    //相当于表格结构
    NSEntityDescription* entity=[NSEntityDescription entityForName:@"Diary" inManagedObjectContext:context];
    //相当于查询语句
    NSFetchRequest* fr=[[NSFetchRequest alloc] init];
    [fr setEntity:entity];
    NSError* error;
    NSArray* ds=[context executeFetchRequest:fr error:&error];
    for (Diary* d in ds) {
        NSLog(@"%@ %@",d.dcontent,d.ddate);
    }
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.apple.ColorDiary" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    //模型存储目录
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ColorDiary" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    //数据库目录
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ColorDiary.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


@end
