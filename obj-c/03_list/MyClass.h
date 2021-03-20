//
//  MyClass.h
//  ListExample
//
//  Created by Виталий Цыганенко on 03/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#ifndef MyClass_h
#define MyClass_h

#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
    int value1;
    float value2;
}

-(void) setValue1: (int) v1 andValue2: (float) v2;
-(NSString*) description;

@end

#endif /* MyClass_h */
