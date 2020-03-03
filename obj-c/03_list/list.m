//
//  list.m
//  ListExample
//
//  Created by Виталий Цыганенко on 03/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "list.h"

@implementation Node

@end

@implementation List
{
    Node* begin;
    Node* end;
}

- (void) add : (id) object
{
    if(!begin) {
        begin = [[Node alloc] init];
        begin->value = object;
        end = begin;
    }
    else {
        Node* new = [[Node alloc] init];
        end->next = new;
        new->prev = end;
        new->value = object;
        end = new;
    }
}

- (void) print
{
    Node* p = begin;
    while(p) {
        NSLog(@"%@", p->value);
        p = p->next;
    }
}

@end
