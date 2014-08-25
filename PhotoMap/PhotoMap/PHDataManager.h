//
//  PHDataManager.h
//  PhotoMap
//
//  Created by mac-229 on 8/21/14.
//  Copyright (c) 2014 Itechart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Photo.h"

@interface PHDataManager : NSObject<NSFetchedResultsControllerDelegate>

@property (nonatomic, readonly, strong) NSArray* photos;

+ (PHDataManager*)sharedInstance;

@end
