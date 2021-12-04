//
//  main.m
//  ObjC_and_CPP
//
//  Created by Виталий Цыганенко on 04.12.2021.
//

#import <Foundation/Foundation.h>

#import "wrapper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        WrapperStringGetter* wrapper = [[WrapperStringGetter alloc] init];
        NSLog(@"Before adding a values:");
        NSLog(@"%@", [wrapper getResult]);
        
        [wrapper addValue:10];
        [wrapper addValue:11];
        [wrapper addValue:12];
        [wrapper addValue:54];
        [wrapper addValue:890];
        
        NSLog(@"After adding a values:");
        NSLog(@"%@", [wrapper getResult]);
        
        [wrapper clearValues];
        
        NSLog(@"After clearing:");
        NSLog(@"%@", [wrapper getResult]);
    }
    return 0;
}
