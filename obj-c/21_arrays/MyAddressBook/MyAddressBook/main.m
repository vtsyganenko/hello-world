//
//  main.m
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 21.01.2023.
//

#import <Foundation/Foundation.h>

#import "MyAddressBook.h"
#import "MyAddressBook+Search.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // address book contains:
        
        // address card
            // first name
            // last name
            // email
            // address object (country, city, zip)
        
        MyAddressBook* book = [[MyAddressBook alloc] initWithName:@"MyBook"];
        NSLog(@"Empty book: %@", book);
        
        [book addRecordWithName:@"Ivan" lastName:@"Petrov" email:@"iv_engine@vak.ru" country:@"Ru" city:@"Msk" zip:103426];
        [book addRecordWithName:@"Fedor" lastName:@"Mykolenko" email:@"fed.gov@oda.ua" country:@"UA" city:@"Odessa" zip:65065];
        [book addRecordWithName:@"John" lastName:@"Doe" email:@"jdoe@gmail.com" country:@"USA" city:@"Phoenix" zip:72901];
        [book addRecordWithName:@"Satoshi" lastName:@"Nahki" email:@"satna@jss.jp" country:@"Japan" city:@"Fukuoka" zip:810];
        [book addRecordWithName:@"Giovanni" lastName:@"Ciesa" email:@"ciesa@seriaa.it" country:@"Italy" city:@"Rome" zip:98100];
        NSLog(@"Full book: %@", book);
        
        NSLog(@"Added %lu records to address book", [book count]);
        
        NSLog(@"Print full book by two ways:");
        [book printAllv1];
        [book printAllv2];
        
        // search one
        void (^printSearchResult) (AddressCard* result) =
            ^(AddressCard* result) {
                if(!result)
                    NSLog(@"Not found!");
                else
                    NSLog(@"Found %@", result);
        };
        AddressCard* result = [book searchOneCardWithFirstName:@"" andLastName:@""];
        printSearchResult(result);
        result = [book searchOneCardWithFirstName:@"John" andLastName:@""];
        printSearchResult(result);
        result = [book searchOneCardWithFirstName:@"" andLastName:@"Nahki"];
        printSearchResult(result);
        result = [book searchOneCardWithFirstName:@"Ivan" andLastName:@"Petrov"];
        printSearchResult(result);
        result = [book searchOneCardWithFirstName:@"Ivan" andLastName:@"Petro"];
        printSearchResult(result);
        
        // add record with same first name
        [book addRecordWithName:@"Ivan" lastName:@"Fedorov" email:@"ivan_fed11@mail.ru" country:@"Russia" city:@"SPB" zip:187015];
        [book printAllv1];
        
        // search group
        void (^printSearchResultGroup) (NSArray* result) =
            ^(NSArray* result) {
                if(!result || ([result count] == 0))
                    NSLog(@"Not found!");
                else {
                    NSLog(@"Found %lu results:", [result count]);
                    for(int i=0; i<[result count]; ++i) {
                        if([result[i] isKindOfClass:[AddressCard class]]) {
                            NSLog(@"%@", result[i]);
                        }
                        else {
                            NSLog(@"object with id %d is not AddressCard!", i);
                        }
                    }
                }
        };
        NSArray* resultGroup = [book searchCardsWithFirstName:@"Ivan" andLastName:@""];
        printSearchResultGroup(resultGroup);
        
        
        
    }
    return 0;
}
