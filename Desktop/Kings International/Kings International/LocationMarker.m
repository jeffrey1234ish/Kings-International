//
//  LocationMarker.m
//  Kings International
//
//  Created by Andrei Chan on 11/3/2015.
//  Copyright (c) 2015年 Andrei Chan. All rights reserved.
//

#import "LocationMarker.h"


@implementation LocationMarker

@dynamic latitude;
@dynamic longitude;
@dynamic name;

+ (instancetype) insertLocationMarkerWithName:(NSString *) name
                                    Longitude:(float)longitude
                                     Latitude: (float)latitude
                       inManagedObjectContext:(NSManagedObjectContext *) managedObjectContext
{
    LocationMarker *locationMarker = [NSEntityDescription insertNewObjectForEntityForName:@"LocationMarker"
                                                                   inManagedObjectContext:managedObjectContext];
    
    locationMarker.name = name;
    locationMarker.longitude = [NSNumber numberWithFloat:longitude];
    locationMarker.latitude = [NSNumber numberWithFloat:latitude];
    
    return locationMarker;
}

@end
