//
//  Annotation.m
//  seriouslyTest
//
//  Created by Markus Jufer on 09.11.14.
//  Copyright (c) 2014 Markus Jufer. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation
@synthesize coordinate, title, subtitle;

- (id)initWithLocation:(CLLocationCoordinate2D)coord {
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    return self;
}

@end