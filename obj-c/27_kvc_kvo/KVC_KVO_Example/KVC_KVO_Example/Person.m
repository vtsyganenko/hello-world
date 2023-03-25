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
@synthesize city;
@synthesize age;
@synthesize spouse;

-(instancetype) init {
    if(self = [super init]) {
        self.name = @"-";
        self.city = @"-";
    }
    return self;
}

-(NSString*) description {
    return [NSString stringWithFormat:@"name %@ city %@ age %lu spouse %@",
            self.name, self.city, self.age,
            self.spouse == nil ? @"-" : self.spouse.name];
}

-(void) incrementAge {
    self.age++;
}

@end
