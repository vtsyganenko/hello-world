//
//  MyClass.m
//  ListExample
//
//  Created by Виталий Цыганенко on 03/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

-(void) setValue1: (int) v1 andValue2: (float) v2
{
    value1 = v1;
    value2 = v2;
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"[%d %f]", value1, value2];
}

@end
