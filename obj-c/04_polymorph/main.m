//
//  main.m
//  Hello
//
//  Created by Виталий Цыганенко on 20/02/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "objects.h"

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        id array[6];
        array[0] = [[ObjectA alloc] init];
        [(ObjectA*)array[0] setValue:10];
        array[1] = [[ObjectA alloc] init];
        [(ObjectA*)array[1] setValue:20];
        array[2] = [[ObjectB alloc] init];
        [(ObjectB*)array[2] setValue:45.3];
        array[3] = [[ObjectB alloc] init];
        [(ObjectB*)array[3] setValue:32.3];
        array[4] = [[ObjectC alloc] init];
        [(ObjectC*)array[4] setValue:"hello"];
        array[5] = [[ObjectC alloc] init];
        [(ObjectC*)array[5] setValue:"world"];
        
        for(int i=0; i<6; ++i) {
            [array[i] print];
        }
        
    }
    return 0;
}
