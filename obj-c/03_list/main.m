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

        MyClass* firstObject = NULL;
        MyClass* centerObject = NULL;
        MyClass* lastObject = NULL;

        // add 7 object and save needed pointers
        for(int i=1; i<=7; ++i) {
            MyClass* obj = [[MyClass alloc] init];
            if(i == 1) { firstObject = obj; }
            if(i == 4) { centerObject = obj; }
            if(i == 7) { lastObject = obj; }
            [obj setValues :i*10 :i*1.5];
            [list add:obj];
        }

        [list printForward];
        [list printBackward];

        [list remove: firstObject];
        [list printForward];
        [list printBackward];

        [list remove: centerObject];
        [list printForward];
        [list printBackward];

        [list remove: lastObject];
        [list printForward];
        [list printBackward];
    }
    return 0;
}
