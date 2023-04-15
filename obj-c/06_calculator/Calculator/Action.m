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
    if([str isEqualToString: @"+"]) {
        return ADDITION;
    }
    if([str isEqualToString: @"-"]) {
        return SUBTRACTION;
    }

    NSLog(@"ADD");
    return ADDITION; // ?
}

+ (NSString*) actionToString: (enum Action) action
{
    switch (action) {
        case ADDITION:
            return @"+";
        case SUBTRACTION:
            return @"-";
        case MULTIPLICATION:
            return @"*";
        case DIVISION:
            return @"/";
        default:
            break;
    }
    return @"";
}

@end
