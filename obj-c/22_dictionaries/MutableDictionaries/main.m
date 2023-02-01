#import <Foundation/Foundation.h>

int main(int argc, const char* argv[]) {
    @autoreleasepool {

        NSMutableDictionary* dict = [NSMutableDictionary dictionary];

        // two ways for filling dictionary
        [dict setObject:@1 forKey:@"one"];
        [dict setObject:@2 forKey:@"two"];
        dict[@"three"] = @3;
        dict[@"four"] = @4;

        NSLog(@"print with first way:");
        for(NSString* key in dict) {
            NSLog(@"dict[%@] = %@", key, [dict objectForKey:key]);
        }
        NSLog(@" ");

        NSLog(@"print with second way:");
        NSArray* keys = [dict allKeys];
        for(int i=0; i<[keys count]; ++i) {
            NSLog(@"dict[%@] = %@", keys[i], dict[keys[i]]);
        }
        NSLog(@" ");

        // remove one object
        NSLog(@"dict contains %lu key-value pairs", [dict count]);
        [dict removeObjectForKey: @"two"];
        NSLog(@"after removal one object: dict contains %lu key-value pairs", [dict count]);

        // use enumerate method for print dictionary
        [dict enumerateKeysAndObjectsUsingBlock: ^void(id key, id obj, BOOL* stop) {
            NSLog(@"key %@ object %@", key, obj);
        }];
        NSLog(@" ");

        // remove all
        [dict removeAllObjects];
        NSLog(@"after removal all objects, dict contains %lu key-value pairs", [dict count]);

    }
    return 0;
}
