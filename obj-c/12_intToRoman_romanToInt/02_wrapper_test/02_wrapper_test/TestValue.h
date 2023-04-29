//
//  TestValue.h
//  02_wrapper_test
//
//  Created by Виталий Цыганенко on 29.04.2023.
//

#ifndef TestValue_h
#define TestValue_h

#import <Foundation/Foundation.h>

@interface TestValue : NSObject

@property (nonatomic)       int number;
@property (nonatomic, copy) NSString* roman;

-(id) initWithNumber: (int) numberVal andRoman: (NSString*) romanVal;

@end

#endif /* TestValue_h */
