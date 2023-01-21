//
//  Address.m
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 21.01.2023.
//

#import <Foundation/Foundation.h>

#import "Address.h"

@implementation Address

@synthesize country;
@synthesize city;
@synthesize zip;

// designated initializer
-(instancetype) initWithCountry:(NSString *)countryValue
                           City:(NSString *)cityValue
                            Zip:(NSUInteger)zipValue {
    if(self = [super init]) {
        country = [NSString stringWithString:countryValue];
        city = [NSString stringWithString:cityValue];
        zip = zipValue;
    }
    return self;
}

-(instancetype) init {
    return [self initWithCountry: @"-" City: @"-" Zip: 0];
}

-(NSString*) toString {
    return [NSString stringWithFormat: @"address: %@/%@ zip(%lu)",
            self.country, self.city, self.zip];
}

@end
