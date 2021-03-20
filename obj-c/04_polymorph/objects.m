//
//  objects.m
//  Hello
//
//  Created by Виталий Цыганенко on 07/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "objects.h"

@implementation ObjectA
{
    int value;
}

-(void) setValue:(int)v
{
    value = v;
}

-(void) print
{
    NSLog(@"ObjectA: %d", value);
}
@end

@implementation ObjectB
{
    double value;
}

-(void) setValue:(double)v
{
    value = v;
}

-(void) print
{
    NSLog(@"ObjectB: %f", value);
}
@end

@implementation ObjectC
{
    char value[128];
}

-(void) setValue:(const char*)v
{
    strcpy(value, v);
}

-(void) print
{
    NSLog(@"ObjectC: %s", value);
}
@end
