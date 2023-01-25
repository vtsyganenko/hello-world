//
//  MyAddressBook.m
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 21.01.2023.
//

#import <Foundation/Foundation.h>

#import "MyAddressBook.h"

#import "Address.h"

@implementation MyAddressBook

@synthesize name;

// designated initializer
-(instancetype) initWithName: (NSString*) nameVal {
    if(self = [super init]) {
        name = [NSString stringWithString: nameVal];
        list = [NSMutableArray array];
    }
    return self;
}

-(instancetype) init {
    return [self initWithName:@"NO_NAME"];
}

-(NSUInteger) count {
    return [list count];
}

-(void) addRecordWithName: (NSString*) firstNameVal lastName: (NSString*) lastNameVal
      email: (NSString*) emailVal country: (NSString*) countryVal
       city: (NSString*) cityVal zip: (NSUInteger) zipVal {
    AddressCard* card = [[AddressCard alloc] initWithFirstName:firstNameVal lastName:lastNameVal email:emailVal country:countryVal city:cityVal zip:zipVal];
    [list addObject:card];
}

// use fast enumeration
-(void) printAllv1 {
    NSLog(@"\t%@:", self);
    for(AddressCard* card in list) {
        NSLog(@"%@", [card toString]);
    }
    NSLog(@"----- end -----");
}

// use enumeration with block
-(void) printAllv2 {
    NSLog(@"\t%@:", self);
    
    [list enumerateObjectsUsingBlock:
     ^(AddressCard* card, NSUInteger idx, BOOL *stop) {
        NSLog(@"[%lu] %@", idx, [card toString]);
    }];
    
    NSLog(@"----- end -----");
}

-(NSString*) description {
    return [NSString stringWithFormat:@"AddressBook \"%@\" contains %lu elements", self.name,
            [list count]];
}

@end
