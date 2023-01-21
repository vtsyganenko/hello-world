//
//  MyAddressBook.h
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 21.01.2023.
//

#ifndef MyAddressBook_h
#define MyAddressBook_h

@class AddressCard;

@interface MyAddressBook : NSObject

@property (readonly, nonatomic) NSString* name;

-(instancetype) initWithName: (NSString*) nameVal;

-(NSUInteger) count;

-(void) addRecordWithName: (NSString*) firstNameVal lastName: (NSString*) lastNameVal
      email: (NSString*) emailVal country: (NSString*) countryVal
       city: (NSString*) cityVal zip: (NSUInteger) zipVal;


-(void) printAll;

@end

#endif /* MyAddressBook_h */
