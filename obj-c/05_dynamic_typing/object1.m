#import "object1.h"

@implementation Object1

-(NSString*) description 
{
    return @"Object1";
}

-(void) methodOne
{
    NSLog(@"Object1 methodOne");
}

-(void) methodTwo: (float) data
{
    NSLog(@"Object1 methodTwo %f", data);
}

-(void) methodThree: (const char*) str
{
    NSLog(@"Object1 methodThree %s", str);
}

-(void) methodFour: (Object2*) obj
{
    NSLog(@"Object1 methodFour with param %@", obj);
}

@end
