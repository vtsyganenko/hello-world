//
//  MyClass.m
//  ListExample
//
//  Created by Виталий Цыганенко on 03/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass
{
    int intValue;
    float floatValue;
}

-(void) setValues: (int) i : (float) f {
    intValue = i;
    floatValue = f;
}

-(NSString*) description {
    return [NSString stringWithFormat:@"[%d %f]", intValue, floatValue];
}

@end
