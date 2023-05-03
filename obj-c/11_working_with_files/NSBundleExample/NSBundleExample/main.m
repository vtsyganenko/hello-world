//
//  main.m
//  NSBundleExample
//
//  Created by Виталий Цыганенко on 03.05.2023.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // to use bundle - need to add "Copy files" build phase (destination - Resources)
        
        // one file
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"txt"];
        NSLog(@"filePath: %@", filePath);
        
        NSError* error;
        NSString* data = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        if(error) {
            NSLog(@"%@", error);
        }
        else {
            NSLog(@"%@", data);
        }
        NSLog(@" ");
        
        // several files in a directory
        NSArray* paths = [[NSBundle mainBundle] pathsForResourcesOfType:@"txt" inDirectory:@"codes"];
        NSLog(@"paths count %lu", [paths count]);
        for(NSString* path in paths) {
            data = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
            if(error) {
                NSLog(@"%@", error);
            }
            else {
                NSLog(@"%@", data);
            }
        }
        
    }
    return 0;
}

