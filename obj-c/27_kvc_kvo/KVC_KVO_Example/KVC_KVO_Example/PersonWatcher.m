//
//  PersonWatcher.m
//  KVC_KVO_Example
//
//  Created by Виталий Цыганенко on 23.03.2023.
//

#import <Foundation/Foundation.h>

#import "PersonWatcher.h"
#import "Person.h"

static NSString* const KVO_CONTEXT_CITY_CHANGED = @"KVO_CONTEXT_CITY_CHANGED";
static NSString* const KVO_CONTEXT_AGE_CHANGED = @"KVO_CONTEXT_AGE_CHANGED";

@implementation PersonWatcher
{
    // dictionary contains list of persons for observed key
    NSMutableDictionary<NSString*, NSMutableArray*> *m_observedPersons;
}

-(id) init {
    if(self = [super init]) {
        m_observedPersons = [NSMutableDictionary dictionary];
        [m_observedPersons setValue:[NSMutableArray array] forKey:@"city"];
        [m_observedPersons setValue:[NSMutableArray array] forKey:@"age"];
    }
    return self;
}

-(void) watchPersonForChangeOfCity: (Person*) p {
    [p addObserver:self
        forKeyPath:@"city"
           options:0
           context:(void*)KVO_CONTEXT_CITY_CHANGED];
    
    NSMutableArray* array = [m_observedPersons valueForKey:@"city"];
    if(array) {
        [array addObject:p];
    }
}

-(void) watchPersonForChangeOfAge: (Person*) p {
    [p addObserver:self
        forKeyPath:@"age"
           options:0
           context:(void*)KVO_CONTEXT_AGE_CHANGED];
    
    NSMutableArray* array = [m_observedPersons valueForKey:@"age"];
    if(array) {
        [array addObject:p];
    }
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    
    if(context == CFBridgingRetain(KVO_CONTEXT_CITY_CHANGED)) {
        NSString *city = [object valueForKey:@"city"];
        NSLog(@"%@ is new city for %@", city, object);
        return;
    }
    if(context == CFBridgingRetain(KVO_CONTEXT_AGE_CHANGED)) {
        NSUInteger age = [object age];
        NSLog(@"%@ has new age: %lu", [object name], age);
        return;
    }
}

-(void) removeObservablePersonsForParameterCity {
    NSMutableArray* array = [m_observedPersons valueForKey:@"city"];
    for(Person* p in array) {
        [p removeObserver:self forKeyPath:@"city"];
    }
    [array removeAllObjects];
}

-(void) removeObservablePersonsForParameterAge {
    NSMutableArray* array = [m_observedPersons valueForKey:@"age"];
    for(Person* p in array) {
        [p removeObserver:self forKeyPath:@"age"];
    }
    [array removeAllObjects];
}

-(void) dealloc {
    // we can implement dealloc under ARC, but don't use [super dealloc]
    // https://stackoverflow.com/questions/6959896/kvo-and-arc-how-to-removeobserver
    NSLog(@"PersonWatcher dealloc");
    
    for(NSString* key in m_observedPersons) {
        NSMutableArray* array = [m_observedPersons valueForKey:key];
        for(Person* p in array) {
            [p removeObserver:self forKeyPath:key];
        }
    }
    [m_observedPersons removeAllObjects];
    m_observedPersons = nil;
}

@end
