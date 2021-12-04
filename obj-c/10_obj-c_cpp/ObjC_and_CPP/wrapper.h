//
//  wrapper.h
//  ObjC_and_CPP
//
//  Created by Виталий Цыганенко on 04.12.2021.
//

#ifndef wrapper_h
#define wrapper_h

#import <Foundation/Foundation.h>

@interface WrapperStringGetter : NSObject
- (void) addValue: (int) value;
- (void) clearValues;
- (NSString* )getResult;
@end

#endif /* wrapper_h */
