//
//  MyAddressBook+Search.h
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 25.01.2023.
//

#ifndef MyAddressBook_Search_h
#define MyAddressBook_Search_h

#import "MyAddressBook.h"

@interface MyAddressBook (Search)

-(AddressCard*) searchOneCardWithFirstName: (NSString*) firstNameVal andLastName: (NSString*) lastNameVal;

-(NSArray*) searchCardsWithFirstName: (NSString*) firstNameVal andLastName: (NSString*) lastNameVal;

@end

#endif /* MyAddressBook_Search_h */
