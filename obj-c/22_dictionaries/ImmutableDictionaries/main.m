#import <Foundation/Foundation.h>

int main(int argc, const char* argv[]) {
    @autoreleasepool {

        // creating 1
        NSDictionary* dict1 = [[NSDictionary alloc] initWithObjectsAndKeys: 
        @"obj1", @"key1", @"obj2", @"key2", @"obj3", @"key3", nil];

        for(NSString* key in dict1) {
            NSLog(@"dict1[%@] = %@", key, [dict1 objectForKey:key]);
        }
        NSLog(@"sorted:");
        NSArray* keys = [[dict1 allKeys] sortedArrayUsingComparator:
            ^(id obj1, id obj2){
                return [obj1 compare: obj2];
            }];
        for(NSString* key in keys) {
            NSLog(@"dict1[%@] = %@", key, dict1[key]);
        }
        NSLog(@" ");


        // creating 2
        NSDictionary* dict2 = [NSDictionary dictionaryWithObjectsAndKeys:
        @22.14, @"coef1", @0.431, @"coef2", @890.043, @"coef3", nil];

        keys = [dict2 allKeys];
        for(NSString* key in [keys sortedArrayUsingSelector:@selector(compare:)]) {
            NSLog(@"dict2[%@] = %@", key, dict2[key]);
        }
        NSLog(@" ");

        // creating 3
        NSDictionary* dict3 = @{@"key1" : @"value1", @"key2" : @"value2", @"key3" : @"value3"};
        NSLog(@"dict3: %@", dict3);
        NSLog(@" ");

        NSLog(@"dict1 count: %lu", [dict1 count]);
        NSLog(@"dict2 count: %lu", [dict2 count]);
        NSLog(@"dict3 count: %lu", [dict3 count]);
        NSLog(@" ");

        // enumerator
        NSEnumerator* enumerator = [dict3 keyEnumerator];
        NSLog(@"dict3 key enumeration:");
        id key;
        while(key = [enumerator nextObject]) {
            NSLog(@"%@", key);
        }
        enumerator = [dict3 objectEnumerator];
        id obj;
        while(obj = [enumerator nextObject]) {
            NSLog(@"%@", obj);
        }
        NSLog(@" ");

        // easy way to get sorted keys
        NSArray* sortedKeys = [dict1 keysSortedByValueUsingSelector: @selector(compare:)];
        NSLog(@"sorted keys from dict1: %@", sortedKeys);

    }
    return 0;
}
