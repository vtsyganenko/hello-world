#import <Foundation/Foundation.h>


int main(int argc, const char* argv[]) {
    @autoreleasepool {

        //                01234...................... last is 26
        NSString* str = @"Hello from strings example!";
        NSMutableString* mstr;
        NSLog(@"source string: %@", str);

        // create mutable string from non-mutable
        mstr = [NSMutableString stringWithString: str];
        NSLog(@"created mutable from source: %@", mstr);

        // insert characters
        [mstr insertString: @" mutable" atIndex: 10];
        NSLog(@"%@", mstr);

        // concatenation if insert at end
        NSString* concat = @" concated string";
        [mstr insertString: concat atIndex: [mstr length]];
        NSLog(@"%@", mstr);

        // direct append
        mstr = [NSMutableString stringWithString: @"first"];
        [mstr appendString: @" and second"];
        NSLog(@"%@", mstr);

        // delete substring (known range)
        mstr = [NSMutableString stringWithString: str];
        NSLog(@"delete substring 1:");
        NSLog(@"before: %@", mstr);
        [mstr deleteCharactersInRange: NSMakeRange(18,8)];
        NSLog(@"after: %@", mstr);

        // delete substring (found range)
        mstr = [NSMutableString stringWithString: str];
        NSLog(@"delete substring 2:");
        NSLog(@"before: %@", mstr);
        NSRange range = [mstr rangeOfString: @"strings "];
        if(range.location != NSNotFound) {
            [mstr deleteCharactersInRange: range];
            NSLog(@"after: %@", mstr);
        }
        else {
            NSLog(@"subsrting is not found!");
        }

        // replace a range of chars with another
        mstr = [NSMutableString stringWithString: @"This is a string !"];
        NSLog(@"source: %@", mstr);
        [mstr replaceCharactersInRange: NSMakeRange(10,6) withString: @"mutable string"];
        NSLog(@"result: %@", mstr);

        //search and replace
        mstr = [NSMutableString stringWithString: @"one two three four five one two three four five one two three four five"];
        NSLog(@"source: %@", mstr);
        NSString* search = @"two";
        NSString* replace = @"2";
        range = [mstr rangeOfString: search];
        if(range.location != NSNotFound) {
            [mstr replaceCharactersInRange: range withString: replace];
            NSLog(@"result: %@", mstr);
        }

        //search and replace (all occurences)
        mstr = [NSMutableString stringWithString: @"one two three four five one two three four five one two three four five"];
        NSLog(@"source: %@", mstr);
        search = @"three";
        replace = @"3";
        range = [mstr rangeOfString: search];
        while(range.location != NSNotFound) {
            [mstr replaceCharactersInRange: range withString: replace];
            range = [mstr rangeOfString: search];
            NSLog(@"result: %@", mstr);
        }

    }
    return 0;
}
