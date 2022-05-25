#ifndef BASED_H
#define BASED_H

#import <Foundation/Foundation.h>

@interface Based : NSObject
{
    int x; // "protected"
}

@property double coef;

-(void) hello;
-(void) printData;
@end

#endif