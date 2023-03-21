//
//  main.m
//  KVC_KVO_Example
//
//  Created by Виталий Цыганенко on 21.03.2023.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person* p1 = [[Person alloc] init];
        [p1 setName:@"Ivan"];
        NSLog(@"p1 %@", p1);

        // use KVC getter
        NSString* originalName = [p1 valueForKey:@"name"];
        
        // use KVC setter
        [p1 setValue:@"Fedor" forKey:@"name"];
        
        NSLog(@"p1 %@", p1);
        NSLog(@"Name was changed from %@ to %@", originalName, p1.name);
        
        Person* p2 = [[Person alloc] init];
        [p2 setName:@"Marya"];
        
        [p1 setSpouse:p2];
        [p2 setSpouse:p1];
        
        NSLog(@"p1 %@", p1);
        NSLog(@"p2 %@", p2);
        
        NSLog(@"%@ is %@ husband", [p1 valueForKey:@"name"], [p1 valueForKeyPath:@"spouse.name"]);
        NSLog(@"%@ is %@ wife", [p2 valueForKey:@"name"], [[p2 valueForKey:@"spouse"] valueForKey:@"name"]);
        
    }
    return 0;
}
