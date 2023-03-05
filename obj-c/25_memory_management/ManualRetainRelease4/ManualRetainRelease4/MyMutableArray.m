//
//  MyMutableArray.m
//  ManualRetainRelease4
//
//  Created by Виталий Цыганенко on 05.03.2023.
//

#import <Foundation/Foundation.h>

#import "MyMutableArray.h"

@implementation MyMutableArray {
    int value_;
}
// workaround
-(instancetype) initWithCapacity:(NSUInteger)numItems {
    return [super init];
}
// workaround
- (NSUInteger)count {
    return 0;
}

-(void) setValue: (int) value {
    value_ = value;
}

-(void) dealloc {
    NSLog(@"dealloc MyMutableArray with value %d", value_);
    [super dealloc];
}

@end
