#import <Foundation/Foundation.h>


int main(int argc, const char* argv[]) {
    @autoreleasepool {

        void (^separator) (void) = 
            ^(void) {
                NSLog(@"\n");
            };

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
        NSLog(@"string from URL \"%@\":", url);
        NSLog(@"%@", str);
        separator();

        // create an empty string
        NSString* es = [NSString string];
        NSMutableString* ems = [NSMutableString string];
        NSLog(@"empty strings: \"%@\" \"%@\"", es, ems);
        [ems appendString: @"some data"];
        NSLog(@"after append: \"%@\"", ems);

        // string with format
        str = [NSString stringWithFormat: @"number %@ string %@ string %s float %f", @150, @"Hello", [ems UTF8String], 22.4];
        NSLog(@"%@", str);
        separator();

        // functions above have init- versions: initWithString, initWithContentsOfFile, initWithContentsOfURL

        // character at index
        str = @"abcdefghijk";
        for(NSUInteger i=0; i < [str length]; ++i) {
            NSLog(@"character at index %lu is %c", i, [str characterAtIndex: i]);
        }
        separator();

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
        separator();

        // prefix and suffix
        firstString = @"abc";
        secondString = @"ijk";
        str = @"abcdefghijk";
        NSLog(@"string is %@", str);
        NSLog(@"%@ is prefix for %@ : %d", firstString, str, [str hasPrefix: firstString]);
        NSLog(@"%@ is prefix for %@ : %d", secondString, str, [str hasPrefix: secondString]);
        NSLog(@"%@ is suffix for %@ : %d", secondString, str, [str hasSuffix: secondString]);
        NSLog(@"%@ is suffix for %@ : %d", firstString, str, [str hasSuffix: firstString]);

        // capitalized string
        str = @"one two three four five";
        NSLog(@"source string: %@", str);
        str = [str capitalizedString];
        NSLog(@"capitalized string: %@", str);
        separator();

        // getting values
        str = @"256.1234567";
        NSLog(@"string \"%@\" to float value is %f", str, [str floatValue]);
        NSLog(@"string \"%@\" to double value is %f", str, [str doubleValue]);
        str = @"3000000000";
        NSLog(@"string \"%@\" to NSInteger %ld and to int %d", str, [str integerValue], [str intValue]);
        str = @"2147483646";
        NSLog(@"string \"%@\" to int %d", str, [str intValue]);
        separator();

        // next methods appear in NSMutableString

        // create with capacity (creates empty string, capacity is for efficiency)
        NSMutableString* mstr = [NSMutableString stringWithCapacity: 10];
        NSLog(@"string with capacity 10 is \"%@\"", mstr);
        mstr = [[NSMutableString alloc] initWithCapacity: 5];
        NSLog(@"string with capacity 5 is \"%@\"", mstr);

        // create
        [mstr setString: @"Hello from mutable string!"];
        NSLog(@"%@", mstr);




    }
    return 0;
}
