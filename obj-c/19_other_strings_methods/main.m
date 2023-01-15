#import <Foundation/Foundation.h>


int main(int argc, const char* argv[]) {
    @autoreleasepool {

        // data from file
        NSString* filePath = @"../file.txt";
        //                                                           NSStringEncoding                NSError
        NSString* str = [NSString stringWithContentsOfFile: filePath encoding: NSASCIIStringEncoding error: NULL];
        NSLog(@"string from file \"%@\":", filePath);
        NSLog(@"%@", str);

        // data from URL
        NSURL* url = [NSURL URLWithString: @"file:///Users/vitaly/.zshrc"];
        str = [NSString stringWithContentsOfURL: url encoding: NSASCIIStringEncoding error: NULL];
        NSLog(@"string from URL \"%@\":", url);
        NSLog(@"%@", str);

        url = [NSURL URLWithString: @"http://google.com"];
        str = [NSString stringWithContentsOfURL: url encoding: NSASCIIStringEncoding error: NULL];
        //NSLog(@"string from URL \"%@\":", url);
        //NSLog(@"%@", str);

        // create an empty string
        NSString* es = [NSString string];
        NSMutableString* ems = [NSMutableString string];
        NSLog(@"empty strings: \"%@\" \"%@\"", es, ems);
        [ems appendString: @"some data"];
        NSLog(@"after append: \"%@\"", ems);

        // string with format
        str = [NSString stringWithFormat: @"number %@ string %@ string %s float %f", @150, @"Hello", [ems UTF8String], 22.4];
        NSLog(@"%@", str);

        // functions above have init- versions: initWithString, initWithContentsOfFile, initWithContentsOfURL

        // character at index
        str = @"abcdefghijk";
        for(NSUInteger i=0; i < [str length]; ++i) {
            NSLog(@"character at index %lu is %c", i, [str characterAtIndex: i]);
        }

        // comparison (lexicographic order, case insensitive)
        NSString* firstString = @"abc";
        NSString* secondString = @"AbC";
        NSComparisonResult res = [firstString caseInsensitiveCompare: secondString];
        NSLog(@"case insensitive comparison: %@ and %@ is %ld", firstString, secondString, res);     // NSOrderedSame
        firstString = @"abd";
        secondString = @"aBc";
        res = [firstString caseInsensitiveCompare: secondString];
        NSLog(@"case insensitive comparison: %@ and %@ is %ld", firstString, secondString, res);     // NSOrderedDescending (first > second)
        firstString = @"Abc";
        secondString = @"abcd";
        res = [firstString caseInsensitiveCompare: secondString];
        NSLog(@"case insensitive comparison: %@ and %@ is %ld", firstString, secondString, res);     // NSOrderedAscending (first < second)

        // prefix and suffix
        firstString = @"abc";
        secondString = @"ijk";
        str = @"abcdefghijk";
        NSLog(@"string is %@", str);
        NSLog(@"%@ is prefix for %@ : %d", firstString, str, [str hasPrefix: firstString]);
        NSLog(@"%@ is prefix for %@ : %d", secondString, str, [str hasPrefix: secondString]);
        NSLog(@"%@ is suffix for %@ : %d", secondString, str, [str hasSuffix: secondString]);
        NSLog(@"%@ is suffix for %@ : %d", firstString, str, [str hasSuffix: firstString]);



    }
    return 0;
}
