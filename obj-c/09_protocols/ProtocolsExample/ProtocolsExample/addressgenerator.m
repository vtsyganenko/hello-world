//
//  addressgenerator.m
//  ProtocolsExample
//
//  Created by Виталий Цыганенко on 24/05/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "addressgenerator.h"

@interface AddressGenerator ()
-(BOOL) isEmpty: (NSString*) str;
@end

@implementation AddressGenerator

-(BOOL) isEmpty: (NSString *)str {
    NSUInteger length = [str length];
    //NSLog(@"size of \"%@\" is %tu", str, length);
    if(!length) return YES;
    
    NSString* strWithoutWhitespaces = [str stringByTrimmingCharactersInSet:
                                       [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    length = [strWithoutWhitespaces length];
    if(!length) return YES;
    
    return NO;
}

-(NSString*) generate {
    NSMutableString* address = [[NSMutableString alloc] init];
    
    // have country
    if([self isEmpty:self.country] == NO) {
        NSString* country = [NSString stringWithFormat:@"%@: ", self.country];
        [address appendString:country];
    }
    
    // have region
    if([self isEmpty:self.region] == NO) {
        NSString* region = [NSString stringWithFormat:@"(%@) ", self.region];
        [address appendString:region];
    }
    
    // have city
    BOOL haveCity = ![self isEmpty:self.city];
    if(haveCity == YES) {
        NSString* city = [NSString stringWithFormat:@"%@", self.city];
        [address appendString:city];
    }
    
    // have street
    BOOL haveStreet = ![self isEmpty:self.street];
    if(haveCity && haveStreet) {
        [address appendString:@", "];
    }
    if(haveStreet == YES) {
        NSString* street = [NSString stringWithFormat:@"%@", self.street];
        [address appendString:street];
    }
    
    // mutable to unmutable
    NSString *result = [NSString stringWithString:address];
    return result;
}

// from protocol SaveableToFile

-(BOOL) saveToFile: (NSString*) fileName {
    NSString* address = [self generate];
    NSError* error;
    BOOL res = [address writeToFile:fileName atomically:YES encoding:NSUnicodeStringEncoding error:&error];
    return res;
}

-(void) printSaveableInfo {
    NSString* address = [self generate];
    NSLog(@"AddressGenerator: %@", address);
}

@end
