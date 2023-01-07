//
//  Single.m
//  Singleton_and_alloc-init
//
//  Created by Виталий Цыганенко on 07.01.2023.
//

#import "Single.h"

// both singletons use static object to share

@implementation SingletonA

+(instancetype) getInstance
{
    static SingletonA* singletonObject = nil;
    // synchronized takes ptr to object and use it as mutex
    @synchronized(self) {
        if (singletonObject == nil ) {
            singletonObject = [[self alloc] init];
        }
    }
    return singletonObject;
}

@synthesize value;

@end


@implementation SingletonB

+ (instancetype)getInstance {
    static SingletonB* singletonObject = nil;
    // predicate must have global or static scope
    static dispatch_once_t predicate;
    // executes a block object only once for the lifetime of an application
    dispatch_once(&predicate, ^{ singletonObject = [[self alloc] init]; });
    return singletonObject;
}

@synthesize value;

@end


// this version has has no thread safety
@implementation MySingleton

@synthesize value;

-(id) init {
    static MySingleton* singletonObject = NULL;
    
    if(!singletonObject) {
        NSLog(@"MySingleton creation");
        if(self = [super init]) {
        }
        singletonObject = self;
    }
    return singletonObject;
}

@end
