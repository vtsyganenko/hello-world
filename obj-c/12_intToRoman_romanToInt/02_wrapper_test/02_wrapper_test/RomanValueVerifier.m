//
//  RomanValueVerifier.m
//  02_wrapper_test
//
//  Created by Виталий Цыганенко on 29.04.2023.
//

#import "RomanValueVerifier.h"

@implementation RomanValueVerifier
{
    NSMutableSet<NSString*> *availableValues;
    BOOL successfulInit;
}

NSString* file = @"/Users/vitaly/Documents/github/hello-world/obj-c/12_intToRoman_romanToInt/01_cpp_console/test_1_to_4999.txt";

-(id) init {
    if(self = [super init]) {
        availableValues = [NSMutableSet set];
        successfulInit = NO;
        NSFileManager* fm = [NSFileManager defaultManager];
        if([fm fileExistsAtPath:file] == NO) {
            NSLog(@"RomanValueVerifier: file is not exist!");
        }
        else {
            NSError* error;
            NSString* content = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:&error];
            if(error) {
                NSLog(@"RomanValueVerifier: file reading error!");
            }
            else {
                NSArray* lines = [content componentsSeparatedByString:@"\n"];
                for(int i=0; i<lines.count; ++i) {
                    NSArray* elements = [lines[i] componentsSeparatedByString:@"="];
                    if(elements) {
                        [availableValues addObject:elements[elements.count-1]];
                        successfulInit = YES;
                    }
                }
            }
        }
        NSLog(@"RomanValueVerifier initialized with %lu values", [availableValues count]);
    }
    return self;
}

-(BOOL) isSuccessfullyInited {
    return successfulInit;
}

-(BOOL) verify: (NSString*) romanValue {
    // this method use isEqual: to compare object
    // for many objects it is just address comparison
    // but it is overridded for NSString to compare characters
    return [availableValues containsObject:romanValue];
}

@end
