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

- (void) add : (id) object {
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

-(void) remove : (id) object {
    NSLog(@"remove object: %@", object);
    Node* p = begin;
    while(p) {
        if(p->value == object) {
            Node* left = p->prev;
            Node* right = p->next;

            if(left) {
                left->next = right;
            }
            else {
                begin = right;
            }
            
            if(right) {
                right->prev = left;
            }
            else {
                end = left;
            }
            
            p->next = NULL;
            p->prev = NULL;
            break;
        }
        p = p->next;
    }
}

-(void) printForward {
    NSLog(@"list forward:");
    Node* p = begin;
    while(p) {
        NSLog(@"%@", p->value);
        p = p->next;
    }
}

-(void) printBackward {
    NSLog(@"list backward:");
    Node* p = end;
    while(p) {
        NSLog(@"%@", p->value);
        p = p->prev;
    }
}

@end
