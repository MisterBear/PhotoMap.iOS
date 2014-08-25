//
//  PHDataManager.m
//  PhotoMap
//
//  Created by mac-229 on 8/21/14.
//  Copyright (c) 2014 Itechart. All rights reserved.
//

#import "PHDataManager.h"

@interface PHDataManager()

@property (nonatomic, readonly, strong) NSFetchedResultsController *frcPhotos;
@property (nonatomic, readonly, strong) NSFetchRequest *request;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation PHDataManager

@synthesize frcPhotos = _frcPhotos;
@synthesize request = _request;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize photos = _photos;

static PHDataManager *instance;

+ (PHDataManager *)sharedInstance
{
    if (!instance)
    {
        instance = [[[self class] alloc] init];
        instance.managedObjectContext = ((PHDataManager*)[UIApplication sharedApplication].delegate).managedObjectContext;
        instance.request;
        NSError *error;
        if (![instance.frcPhotos performFetch:&error]) {
            // Update to handle the error appropriately.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
    }
    
    return instance;
}

- (NSFetchedResultsController *)frcPhotos
{
    if (_frcPhotos != nil)
    {
        return _frcPhotos;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Photo" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"photoName" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:_managedObjectContext sectionNameKeyPath:nil
                                                   cacheName:@"AllDepartments"];
    _frcPhotos = theFetchedResultsController;
    _frcPhotos.delegate = self;
    
    return _frcPhotos;
}

- (NSFetchRequest *)request
{
    if (!_request)
    {
        _request = [NSFetchRequest new];
    }
    return _request;
}



@end
