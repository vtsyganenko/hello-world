//
//  AddressCard.h
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 21.01.2023.
//

#ifndef AddressCard_h
#define AddressCard_h

@class Address;

@interface AddressCard : NSObject
{
    Address* address;
}

@property (copy, nonatomic) NSString* firstName;
@property (copy, nonatomic) NSString* lastName;
@property (copy, nonatomic) NSString* email;

-(instancetype) initWithFirstName: (NSString*) firstNameVal
                         lastName: (NSString*) lastNameVal
                            email: (NSString*) emailVal
                          country: (NSString*) countryVal
                          city: (NSString*) cityVal
                              zip: (NSUInteger) zipVal;

-(instancetype) initWithFirstName: (NSString*) firstNameVal
                         lastName: (NSString*) lastNameVal
                            email: (NSString*) emailVal
                          address: (Address*) addressVal;


-(NSString*) toString;

-(NSString*) description;

@end

#endif /* AddressCard_h */
