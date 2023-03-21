//
//  Person.m
//  KVC_KVO_Example
//
//  Created by Виталий Цыганенко on 21.03.2023.
//

#import <Foundation/Foundation.h>

#import "Person.h"

@implementation Person

@synthesize name;
@synthesize spouse;

-(NSString*) description {
    return [NSString stringWithFormat:@"Person: name %@ spouse %@", self.name, self.spouse == nil ? @"-" : self.spouse.name];
}

@end
