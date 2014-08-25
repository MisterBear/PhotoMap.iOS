//
//  Photo.h
//  PhotoMap
//
//  Created by mac-229 on 8/21/14.
//  Copyright (c) 2014 Itechart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Photo : NSManagedObject

@property (nonatomic, retain) NSString * photoName;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) NSString * filePath;
@property (nonatomic, retain) NSNumber * isUpload;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSNumber * latitude;

@end
