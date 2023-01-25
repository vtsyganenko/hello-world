//
//  MyAddressBook+Search.m
//  MyAddressBook
//
//  Created by Виталий Цыганенко on 25.01.2023.
//

#import <Foundation/Foundation.h>

#import "MyAddressBook+Search.h"

#import "AddressCard.h"

@implementation MyAddressBook (Search)

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
    
    if(firstNameIsEmpty) {
        for(card in list) {
            if([card.lastName caseInsensitiveCompare:lastNameVal] == NSOrderedSame) {
                [result addObject:card];
            }
        }
    }
    
    if(lastNameIsEmpty) {
        for(card in list) {
            if([card.firstName caseInsensitiveCompare:firstNameVal] == NSOrderedSame) {
                [result addObject:card];
            }
        }
        return result;
    }
    
    for(card in list) {
        for(card in list) {
            if([card.firstName caseInsensitiveCompare:firstNameVal] == NSOrderedSame &&
               [card.lastName caseInsensitiveCompare:lastNameVal] == NSOrderedSame) {
                [result addObject:card];
            }
        }
    }
    
    return nil;
}

-(void) removeCard: (AddressCard*) cardVal {
    [list removeObjectIdenticalTo: cardVal];
}

-(void) removeOneCardWithFirstName: (NSString*) firstNameVal andLastName: (NSString*) lastNameVal {
    AddressCard* card = [self searchOneCardWithFirstName:firstNameVal andLastName:lastNameVal];
    [self removeCard:card];
}

-(void) removeEqualCard: (AddressCard*) cardVal {
    NSMutableArray* toRemove = [NSMutableArray array];
    for(AddressCard* card in list) {
        if([cardVal isEqual:card] == YES) {
            [toRemove addObject:card];
        }
    }
    for(int i=0; i<[toRemove count]; ++i) {
        [self removeCard:toRemove[i]];
    }
}

@end
