//
//  AddressCard.m
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 21.01.2023.
//

#import <Foundation/Foundation.h>

#import "AddressCard.h"
#import "Address.h"

@implementation AddressCard

@synthesize firstName;
@synthesize lastName;
@synthesize email;

// designated initializer
-(instancetype) initWithFirstName:(NSString *)firstNameVal lastName:(NSString *)lastNameVal email:(NSString *)emailVal country:(NSString *)countryVal city:(NSString *)cityVal zip:(NSUInteger)zipVal {
    if(self = [super init]) {
        firstName = [NSString stringWithString:firstNameVal];
        lastName = [NSString stringWithString:lastNameVal];
        email = [NSString stringWithString:emailVal];
        address = [[Address alloc] initWithCountry:countryVal City:cityVal Zip:zipVal];
    }
    return self;
}

-(instancetype) initWithFirstName:(NSString *)firstNameVal lastName:(NSString *)lastNameVal email:(NSString *)emailVal address:(Address *)addressVal {
    return [self initWithFirstName:firstNameVal lastName:lastNameVal email:emailVal
                           country:[addressVal country]
                              city:[addressVal city]
                               zip:[addressVal zip]];
}

-(instancetype) init {
    return [self initWithFirstName:@"-" lastName:@"-" email:@"-" country:@"-" city:@"-" zip:0];
}

-(Address*) getAddress {
    Address* addr = [[Address alloc] initWithCountry:address.country City:address.city Zip:address.zip];
    return addr;
}

-(BOOL) isEqual: (AddressCard*) other {
    if([firstName isEqualToString:other.firstName] == YES &&
        [lastName isEqualToString:other.lastName] == YES &&
         [email isEqualToString:other.email] == YES &&
          [address isEqual:other.getAddress] == YES) {
        return YES;
    }
    return NO;
}

-(NSString*) toString {
    return [NSString stringWithFormat:@"%@.%@ %@ [%@]", self.firstName, self.lastName,
            self.email, [address toString]];
}

-(NSString*) description {
    return self.toString;
}

@end
