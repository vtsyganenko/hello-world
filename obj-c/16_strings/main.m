#import <Foundation/Foundation.h>

#import "myclass.h"

int main(int argc, const char* argv[]) {
    @autoreleasepool {

        NSString* str = @"Hello World!";
        NSLog(@"%@", str);

        // usage of description: method

        // without description
        OtherClass* obj1 = [[OtherClass alloc] init];
        [obj1 setValue: 25];
        NSLog(@"OtherClass %@", obj1);
        // with description
        MyClass* obj2 = [[MyClass alloc] initWithValue1: 10 andValue2: 45.63];
        NSLog(@"MyClass %@", obj2);

        // work with strings

        // length
        NSString* firstString = @"12345678910";
        NSLog(@"string \"%@\" has length: %lu", firstString,  [firstString length]);

        // copy
        NSString* secondString;
        secondString = [NSString stringWithString: firstString];
        NSLog(@"copied string is %@", secondString);
        
        // append
        firstString = @"one";
        secondString = @"second";
        NSString* concatString =  [firstString stringByAppendingString: secondString];
        NSLog(@"concatenation: %@ + %@ = %@", firstString, secondString, concatString);

        // equality
        NSLog(@"\"%@\" == \"%@\" %@", firstString, secondString, 
            ([firstString isEqualToString: secondString] == YES ? @"YES" : @"NO"));
        secondString = [NSString stringWithString: firstString];
        NSLog(@"\"%@\" == \"%@\" %@", firstString, secondString, 
            ([firstString isEqualToString: secondString] == YES ? @"YES" : @"NO"));

        // comparison (lexicographic order)
        firstString = @"abc";
        secondString = @"abc";
        NSComparisonResult res = [firstString compare: secondString];
        NSLog(@"comparison: %@ and %@ is %ld", firstString, secondString, res);     // NSOrderedSame
        firstString = @"abd";
        secondString = @"abc";
        res = [firstString compare: secondString];
        NSLog(@"comparison: %@ and %@ is %ld", firstString, secondString, res);     // NSOrderedDescending (first > second)
        firstString = @"abc";
        secondString = @"abcd";
        res = [firstString compare: secondString];
        NSLog(@"comparison: %@ and %@ is %ld", firstString, secondString, res);     // NSOrderedAscending (first < second)

        // uppercase and lowercase
        firstString = @"Original string!";
        NSLog(@"%@", firstString);
        secondString = [firstString uppercaseString];
        NSLog(@"upper: %@", secondString);
        secondString = [firstString lowercaseString];
        NSLog(@"lower: %@", secondString);

        // string output
        NSLog(@"string is \"%s\"", [firstString UTF8String]);

    }
    return 0;
}
