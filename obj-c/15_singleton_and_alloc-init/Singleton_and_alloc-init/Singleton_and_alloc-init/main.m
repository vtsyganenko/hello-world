//
//  main.m
//  Singleton_and_alloc-init
//
//  Created by Виталий Цыганенко on 07.01.2023.
//

#import <Foundation/Foundation.h>

#import "RegularClass.h"
#import "Single.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // regular creation - alloc and init together
        RegularClass* regular1 = [[RegularClass alloc] init];
        [regular1 setValue:10];
        NSLog(@"regular1 value is %d", [regular1 value]);
        
        // separate not recommended, but works in this case
        RegularClass* regular2 = [RegularClass alloc];
        [regular2 init];
        [regular2 setValue:20];
        NSLog(@"regular2 value is %d", [regular2 value]);
        
        // singleton supposes usage of special method (getInstance) not direct init()
        SingletonA* singleA1 = [SingletonA getInstance];
        [singleA1 setValue:30];
        NSLog(@"singleA1 value is %d", [singleA1 value]);
        
        SingletonA* singleA2 = [SingletonA getInstance];
        NSLog(@"singleA2 value is %d", [singleA2 value]);
        
        SingletonB* singleB1 = [SingletonB getInstance];
        [singleB1 setValue:40];
        NSLog(@"singleB1 value is %d", [singleB1 value]);
        
        SingletonB* singleB2 = [SingletonB getInstance];
        NSLog(@"singleB2 value is %d", [singleB2 value]);
        
        // self-made version without thread safety
        MySingleton* obj1 = [[MySingleton alloc] init];
        [obj1 setValue:50];
        NSLog(@"MySingleton1 value is %d", [obj1 value]);
        
        MySingleton* obj2 = [[MySingleton alloc] init];
        NSLog(@"MySingleton2 value is %d", [obj2 value]);
        
        // this doesn't work
        MySingleton* obj3 = [MySingleton alloc];
        [obj3 init];
        NSLog(@"MySingleton3 value is %d", [obj3 value]);
        
        // this works, but it redundant
        MySingleton* obj4 = [MySingleton alloc];
        obj4 = [obj4 init];
        NSLog(@"MySingleton4 value is %d", [obj4 value]);
        
    }
    return 0;
}
