//
//  main.m
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 21.01.2023.
//

#import <Foundation/Foundation.h>

#import "MyAddressBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // address card
            // first name + last name
            // email
            // address object (country, city, zip)
        
        // address book
        
        MyAddressBook* book = [[MyAddressBook alloc] initWithName:@"MyBook"];
        NSLog(@"%@", book);
        
        [book addRecordWithName:@"Ivan" lastName:@"Petrov" email:@"iv_engine@vak.ru" country:@"Ru" city:@"Msk" zip:103426];
        [book addRecordWithName:@"John" lastName:@"Doe" email:@"jdoe@gmail.com" country:@"USA" city:@"Phoenix" zip:72901];
        [book addRecordWithName:@"Satoshi" lastName:@"Nahki" email:@"satna@jss.jp" country:@"Japan" city:@"Fukuoka" zip:810];
        NSLog(@"%@", book);
        
        NSLog(@"Added %lu records to address book", [book count]);
        
        [book printAll];
        
        
    }
    return 0;
}
