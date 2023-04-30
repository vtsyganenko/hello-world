//
//  RomanValueVerifier.h
//  02_wrapper_test
//
//  Created by Виталий Цыганенко on 29.04.2023.
//

#ifndef RomanValueVerifier_h
#define RomanValueVerifier_h

#import <Foundation/Foundation.h>

// Additional class to verify if roman string is correct
// based on file with roman values from 0 to 4999
// in opposite to ConverterWrapper::isCorrectRomanString()
@interface RomanValueVerifier : NSObject

-(BOOL) isSuccessfullyInited;

-(BOOL) verify: (NSString*) romanValue;

@end

#endif /* RomanValueVerifier_h */
