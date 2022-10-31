#import "classes.h"

@implementation A

@synthesize value;

-(void) print {
    NSLog(@"A::print value %d", value);
}

@end

@implementation B

-(void) print {
    NSLog(@"B::print value %d", [self value]);
}

@end

@implementation C

-(void) print {
    NSLog(@"C::print value %d", [self value]);
}

@end
