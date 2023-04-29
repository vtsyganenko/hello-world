//
//  main.m
//  02_wrapper_test
//
//  Created by Виталий Цыганенко on 28.04.2023.
//

#import <Foundation/Foundation.h>

#import "converter_wrapper.h"
#import "TestValue.h"

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

void readTestData(NSString* filePath, NSMutableArray* outTestData) {
    NSFileManager* fm = [NSFileManager defaultManager];
    BOOL fileAvailable = [fm fileExistsAtPath:filePath];
    if(fileAvailable == NO) {
        NSLog(@"readTestData: file \"%@\" is not exist!", filePath);
        return;
    }
    
    NSError* error;
    NSString* content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if(error) {
        NSLog(@"File reading error: %@", error.localizedDescription);
    }
    
    NSArray* lines = [content componentsSeparatedByString:@"\n"];
    for(int i=0; i<lines.count; ++i) {
        
        NSArray* elements = [lines[i] componentsSeparatedByString:@"="];
        if(elements) {
            TestValue* value = [[TestValue alloc] initWithNumber:[elements[0] intValue]
                                                        andRoman:elements[elements.count - 1]];
            [outTestData addObject:value];
        }
    }
}

void run_test_romanToInt(NSMutableArray<TestValue*> *testData) {
    int testCount = 0;
    int failuresCount = 0;
    ConverterWrapper* obj = [[ConverterWrapper alloc] init];
    for(TestValue* value in testData) {
        int number = [obj romanToInt:value.roman];
        if(number != value.number)
            failuresCount++;
        testCount++;
    }
    printf("run_test_romanToInt for %d tests: %d failuries\n", testCount, failuresCount);
}

void run_test_intToRoman(NSMutableArray<TestValue*> *testData) {
    int testCount = 0;
    int failuresCount = 0;
    ConverterWrapper* obj = [[ConverterWrapper alloc] init];
    for(TestValue* value in testData) {
        NSString* roman = [obj intToRoman:value.number];
        if([roman isEqualToString:value.roman] == NO)
            failuresCount++;
        testCount++;
    }
    printf("run_test_intToRoman for %d tests: %d failuries\n", testCount, failuresCount);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        run_test_isAppropriateIntegerValue();
        
        run_test_isCorrectRomanString();
        
        NSMutableArray* data20 = [NSMutableArray array];
        readTestData(
        @"/Users/vitaly/Documents/github/hello-world/obj-c/12_intToRoman_romanToInt/01_cpp_console/test_1_to_20.txt", data20);

        run_test_romanToInt(data20);
        run_test_intToRoman(data20);
        
        NSMutableArray* data5000 = [NSMutableArray array];
        readTestData(
        @"/Users/vitaly/Documents/github/hello-world/obj-c/12_intToRoman_romanToInt/01_cpp_console/test_1_to_4999.txt", data5000);
        
        run_test_romanToInt(data5000);
        run_test_intToRoman(data5000);
    }
    return 0;
}
