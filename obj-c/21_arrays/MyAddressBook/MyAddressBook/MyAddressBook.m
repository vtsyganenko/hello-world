//
//  MyAddressBook.m
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 21.01.2023.
//

#import <Foundation/Foundation.h>

#import "MyAddressBook.h"

#import "AddressCard.h"
#import "Address.h"

@implementation MyAddressBook
{
    NSMutableArray* list;
}

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

-(AddressCard*) searchOneCardWithFirstName: (NSString*) firstNameVal andLastName: (NSString*) lastNameVal {
    AddressCard* card = NULL;
    BOOL firstNameIsEmpty = [firstNameVal length] == 0;
    BOOL lastNameIsEmpty = [lastNameVal length] == 0;
    
    if(firstNameIsEmpty && lastNameIsEmpty) return nil;
    
    if(firstNameIsEmpty) {
        for(card in list) {
            if([card.lastName caseInsensitiveCompare:lastNameVal] == NSOrderedSame) {
                return card;
            }
        }
        return nil;
    }
    
    if(lastNameIsEmpty) {
        for(card in list) {
            if([card.firstName caseInsensitiveCompare:firstNameVal] == NSOrderedSame) {
                return card;
            }
        }
        return nil;
    }
    
    for(card in list) {
        for(card in list) {
            if([card.firstName caseInsensitiveCompare:firstNameVal] == NSOrderedSame &&
               [card.lastName caseInsensitiveCompare:lastNameVal] == NSOrderedSame) {
                return card;
            }
        }
    }
    return nil;
}

-(NSArray*) searchCardsWithFirstName: (NSString*) firstNameVal andLastName: (NSString*) lastNameVal {
    NSMutableArray* result = [NSMutableArray array];
    AddressCard* card = NULL;
    
    BOOL firstNameIsEmpty = [firstNameVal length] == 0;
    BOOL lastNameIsEmpty = [lastNameVal length] == 0;
    if(firstNameIsEmpty && lastNameIsEmpty) return nil;
    
    //...
    
    if(lastNameIsEmpty) {
        for(card in list) {
            if([card.firstName caseInsensitiveCompare:firstNameVal] == NSOrderedSame) {
                [result addObject:card];
            }
        }
        return result;
    }
    
    // ...
    
    return nil;
}

// use fast enumeration
-(void) printAllv1 {
    NSLog(@"%@:", self);
    for(AddressCard* card in list) {
        NSLog(@"%@", [card toString]);
    }
    NSLog(@"----- end -----");
}

// use enumeration with block
-(void) printAllv2 {
    NSLog(@"%@:", self);
    
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
