//
//  Address.h
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 21.01.2023.
//

#ifndef Address_h
#define Address_h

@interface Address : NSObject

@property (copy, nonatomic) NSString* country;
@property (copy, nonatomic) NSString* city;
@property (nonatomic) NSUInteger zip;

-(instancetype) initWithCountry: (NSString*) countryValue
                           City: (NSString*) cityValue
                            Zip: (NSUInteger) zipValue;

-(NSString*) toString;

-(BOOL) isEqual: (Address*) other;

@end

#endif /* Address_h */
