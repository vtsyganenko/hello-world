//
//  Action.h
//  Calculator
//
//  Created by Виталий Цыганенко on 15/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#ifndef Action_h
#define Action_h

#import <Foundation/Foundation.h>

enum Action {
    ADD,    // +
    SUB     // -
};

@interface ActionHelper : NSObject
+ (enum Action) stringToAction: (NSString*) str;
+ (NSString*) actionToString: (enum Action) action;
@end

#endif /* Action_h */
