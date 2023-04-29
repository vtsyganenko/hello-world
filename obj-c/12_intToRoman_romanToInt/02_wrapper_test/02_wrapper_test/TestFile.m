//
//  TestFile.m
//  02_wrapper_test
//
//  Created by Виталий Цыганенко on 29.04.2023.
//

#import "TestValue.h"

@implementation TestValue

@synthesize number;
@synthesize roman;

-(id) initWithNumber: (int) numberVal andRoman: (NSString*) romanVal {
    if(self = [super init]) {
        self.number = numberVal;
        self.roman = romanVal;
    }
    return self;
}

@end
