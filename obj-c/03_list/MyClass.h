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

// placeholder class
@interface MyClass : NSObject

// argument names are optional (not good style)
-(void) setValues: (int) i : (float) f;
// this method is called when we call NSLog(@"%@", object)
-(NSString*) description;

@end

#endif /* MyClass_h */
