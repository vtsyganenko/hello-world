#import <Foundation/Foundation.h>


int main(int argc, const char* argv[]) {
    @autoreleasepool {

        //                01234...................... last is 26
        NSString* str = @"Hello from strings example!";
        NSString* res;
        NSLog(@"source string: %@", str);

        res = [str substringToIndex: 5];
        NSLog(@"from 0 to 5: %@", res);

        res = [str substringFromIndex: 26];
        NSLog(@"from 26 to end: %@", res);

        res = [[str substringFromIndex: 6] substringToIndex: 4];
        NSLog(@"from 6, take 0..4 symbols: %@", res);

        // NSMakeRange(location, length)
        NSRange range = NSMakeRange(6, 4);
        res = [str substringWithRange: range];
        NSLog(@"the same as above with range(6,4): %@", res);

        // look for substring
        NSString* subString = @"other";
        range = [str rangeOfString: subString];
        NSLog(@"substring \"%@\" in string \"%@\" has index %lu and length %lu", subString, str, range.location, range.length);
        if(range.location == NSNotFound) NSLog(@"substring is not found");

        subString = @"string";
        range = [str rangeOfString: subString];
        NSLog(@"substring \"%@\" in string \"%@\" has index %lu and length %lu", subString, str, range.location, range.length);
        if(range.location == NSNotFound) NSLog(@"substring is not found");

    }
    return 0;
}
