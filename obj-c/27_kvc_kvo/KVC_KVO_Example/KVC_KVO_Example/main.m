//
//  main.m
//  KVC_KVO_Example
//
//  Created by Виталий Цыганенко on 21.03.2023.
//

#import <Foundation/Foundation.h>

#import "Person.h"
#import "PersonWatcher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person* p1 = [[Person alloc] init];
        [p1 setName:@"Ivan"];
        [p1 setAge:25];
        NSLog(@"p1 %@", p1);

        // use KVC getter
        NSString* originalName = [p1 valueForKey:@"name"];
        
        // use KVC setter
        [p1 setValue:@"Fedor" forKey:@"name"];
        
        NSLog(@"p1 %@", p1);
        NSLog(@"Name was changed from %@ to %@", originalName, p1.name);
        
        Person* p2 = [[Person alloc] init];
        [p2 setName:@"Marya"];
        [p2 setAge:23];
        
        [p1 setSpouse:p2];
        [p2 setSpouse:p1];
        
        NSLog(@"p1 %@", p1);
        NSLog(@"p2 %@", p2);
        
        NSLog(@"%@ is %@ husband", [p1 valueForKey:@"name"], [p1 valueForKeyPath:@"spouse.name"]);
        NSLog(@"%@ is %@ wife", [p2 valueForKey:@"name"], [[p2 valueForKey:@"spouse"] valueForKey:@"name"]);
        NSLog(@" ");
        
        
        PersonWatcher* watcher = [[PersonWatcher alloc] init];
        [watcher watchPersonForChangeOfCity:p1];
        [watcher watchPersonForChangeOfCity:p2];
        
        [p1 setValue:@"Moscow" forKey:@"city"];
        [p2 setValue:@"Vladimir" forKeyPath:@"city"];
        
        [watcher watchPersonForChangeOfAge:p1];
        [watcher watchPersonForChangeOfAge:p2];
        
        [p1 incrementAge];
        [p2 setValue:@24 forKey:@"age"];
        
        // remove directly
        [watcher removeObservablePersonsForParameterCity];
        
        [p1 setValue:@"Moscow" forKey:@"city"];
        [p2 setValue:@"Vladimir" forKeyPath:@"city"];
        
        // this will be done in dealloc
        //[watcher removeObservablePersonsForParameterAge];
        
        [p1 incrementAge];
        [p2 incrementAge];
    
        // So, remember to remove observers
        // 1. before observer is dealloced
        // 2. before the sender is dealloced
        
        // Also the observer must know the life circle of the sender,
        // and before the sender is freed,
        // the observer must remove the observation from the sender.
        
        NSLog(@" ");
        NSLog(@"%@", p1);
        NSLog(@"%@", p2);
    }
    return 0;
}
