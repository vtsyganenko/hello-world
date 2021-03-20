//
//  objects.h
//  Hello
//
//  Created by Виталий Цыганенко on 07/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#ifndef objects_h
#define objects_h

#import <Foundation/Foundation.h>

@interface ObjectA : NSObject
-(void) setValue : (int) v;
-(void) print;
@end

@interface ObjectB : NSObject
-(void) setValue : (double) v;
-(void) print;
@end

@interface ObjectC : NSObject
-(void) setValue : (const char*) v;
-(void) print;
@end

#endif /* objects_h */
