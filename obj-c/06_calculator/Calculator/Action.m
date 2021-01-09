//
//  Action.m
//  Calculator
//
//  Created by Виталий Цыганенко on 09/01/2021.
//  Copyright © 2021 Виталий Цыганенко. All rights reserved.
//

#import "Action.h"

@implementation ActionHelper
{
}

+ (enum Action) stringToAction: (NSString*) str
{
    NSLog(@"stringToAction %@", str);
    if([str isEqualToString: @"+"]) {
        NSLog(@"ADD");
        return ADD;
    }
    if([str isEqualToString: @"-"]) {
        NSLog(@"SUB");
        return SUB;
    }

    NSLog(@"ADD");
    return ADD;
}

+ (NSString*) actionToString: (enum Action) action
{
    switch (action) {
        case ADD:
            return @"+";
        case SUB:
            return @"-";
        default:
            break;
    }
    return @"";
}

@end
