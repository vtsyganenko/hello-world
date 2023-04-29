//
//  converter_wrapper.h
//  02_wrapper_test
//
//  Created by Виталий Цыганенко on 28.04.2023.
//

#ifndef converter_wrapper_h
#define converter_wrapper_h

#import <Foundation/Foundation.h>

@interface ConverterWrapper : NSObject

// assumes a correct roman string
-(int) romanToInt: (NSString*) roman;

// assumes an appropriate integer
-(NSString*) intToRoman: (int) integer;

// I, V, X, L, C, D, M
-(BOOL) isCorrectRomanString: (NSString*) string;

// 1..4999
-(BOOL) isAppropriateIntegerValue: (int) integer;

@end

#endif /* converter_wrapper_h */
