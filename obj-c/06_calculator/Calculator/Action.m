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
        return ADD;
    }
    if([str isEqualToString: @"-"]) {
        return SUB;
    }

    NSLog(@"ADD");
    return ADD; // ?
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
