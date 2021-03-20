//
//  list.h
//  ListExample
//
//  Created by Виталий Цыганенко on 03/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#ifndef list_h
#define list_h

#import <Foundation/Foundation.h>

@interface Node : NSObject
{
@public
    id value;
    Node* next;
    Node* prev;
}
@end

@interface List : NSObject

- (void) add : (id) object;
- (void) print;

@end

#endif /* list_h */
