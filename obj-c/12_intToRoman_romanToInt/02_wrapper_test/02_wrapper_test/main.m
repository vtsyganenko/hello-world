//
//  main.m
//  02_wrapper_test
//
//  Created by Виталий Цыганенко on 28.04.2023.
//

#import <Foundation/Foundation.h>

#import "converter_wrapper.h"

struct IntegerValue {
    int value;
    bool appropriate;
};

void run_test_isAppropriateIntegerValue() {
    printf("run_test_isAppropriateIntegerValue:\n");
    struct IntegerValue v1 = {0, NO};
    struct IntegerValue v2 = {1, YES};
    struct IntegerValue v3 = {2000, YES};
    struct IntegerValue v4 = {4999, YES};
    struct IntegerValue v5 = {5000, NO};
    
    NSArray* testData = @[ [NSValue value:&v1 withObjCType:@encode(struct IntegerValue)],
                           [NSValue value:&v2 withObjCType:@encode(struct IntegerValue)],
                           [NSValue value:&v3 withObjCType:@encode(struct IntegerValue)],
                           [NSValue value:&v4 withObjCType:@encode(struct IntegerValue)],
                           [NSValue value:&v5 withObjCType:@encode(struct IntegerValue)] ];
    
    ConverterWrapper* obj = [[ConverterWrapper alloc] init];
    
    for(NSValue* value in testData) {
        struct IntegerValue tmp;
        [value getValue:&tmp];
        BOOL result = [obj isAppropriateIntegerValue:tmp.value];
        printf("isAppropriateIntegerValue(%d) = %d -> %s \n", tmp.value, result,
               result == tmp.appropriate ? "passed" : "failed");
    }
    printf("\n");
}

struct StringValue {
    NSString* value;
    bool correct;
};

void run_test_isCorrectRomanString() {
    printf("run_test_isCorrectRomanString:\n");
    
    struct StringValue v1 = {@"", NO};
    struct StringValue v2 = {@"IVXLCDM", YES};
    struct StringValue v3 = {@"ABEGH", NO};
    struct StringValue v4 = {@"IVXZNOP", NO};
    
    NSArray* testData = @[ [NSValue value:&v1 withObjCType:@encode(struct StringValue)],
                           [NSValue value:&v2 withObjCType:@encode(struct StringValue)],
                           [NSValue value:&v3 withObjCType:@encode(struct StringValue)],
                           [NSValue value:&v4 withObjCType:@encode(struct StringValue)] ];
    
    ConverterWrapper* obj = [[ConverterWrapper alloc] init];
    
    for(NSValue* value in testData) {
        struct StringValue tmp;
        [value getValue:&tmp];
        BOOL result = [obj isCorrectRomanString:tmp.value];
        printf("isCorrectRomanString(%s) = %d -> %s \n", [tmp.value UTF8String], result,
              result == tmp.correct ? "passed" : "failed");
    }
    printf("\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        run_test_isAppropriateIntegerValue();
        
        run_test_isCorrectRomanString();
        
    }
    return 0;
}
