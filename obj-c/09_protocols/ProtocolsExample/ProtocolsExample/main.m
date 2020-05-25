//
//  main.m
//  ProtocolsExample
//
//  Created by Виталий Цыганенко on 24/05/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "addressgenerator.h"

void loadAndLog(NSString* fileName) {
    NSError* error;
    NSString *stringFromFileAtPath = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUnicodeStringEncoding error:&error];
    NSLog(@"Have read from file \"%@\": %@", fileName, stringFromFileAtPath);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AddressGenerator* addr = [[AddressGenerator alloc] init];
        [addr setCountry:@"Russia"];
        [addr setRegion:@"N.Novgorod Region"];
        [addr setCity:@"Nizhny Novgorod"];
        [addr setStreet:@"Fedoseenko"];
        NSLog(@"Full address is %@", [addr generate]);
        
        // test saving
        NSString* addressFilePath = @"MyAddress.txt";
        BOOL res = [addr saveToFile:addressFilePath];
        NSLog(@"saving is %d", res);
        
        // load
        loadAndLog(addressFilePath);
        
        // test printing
        [addr printSaveableInfo];
    }
    return 0;
}
