//
//  main.m
//  ListExample
//
//  Created by Виталий Цыганенко on 03/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "list.h"
#import "MyClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        List* list = [[List alloc] init];
        for(int i=0; i<5; ++i) {
            MyClass* obj = [[MyClass alloc] init];
            int v = i+1;
            [obj setValue1:v+10 andValue2:v*22.4];
            [list add:obj];
        }
        [list print];
        
    }
    return 0;
}
