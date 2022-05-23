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

        for(int i=1; i<6; ++i) {
            MyClass* obj = [[MyClass alloc] init];
            [obj setValues :i*10 :i*22.4];
            [list add:obj];
        }

        [list print];
    }
    return 0;
}
