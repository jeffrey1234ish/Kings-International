//
//  LocationMarker.h
//  Kings International
//
//  Created by Andrei Chan on 11/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface LocationMarker : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;

+ (instancetype) insertLocationMarkerWithName:(NSString *) name
                                    Longitude:(float)longitude
                                     Latitude: (float)latitude
                       inManagedObjectContext:(NSManagedObjectContext *) managedObjectContext;

@end
