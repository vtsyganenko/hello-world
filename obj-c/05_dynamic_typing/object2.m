#import "object2.h"

@implementation Object2

-(NSString*) description 
{
    return @"Object2";
}

-(void) methodOne
{
    NSLog(@"Object2 methodOne");
}

-(void) methodTwo: (int) data
{
    NSLog(@"Object2 methodTwo %d", data);
}

-(void) methodThree: (const char*) str
{
    NSLog(@"Object2 methodThree %s", str);
}

-(void) methodFour: (Object1*) obj
{
    NSLog(@"Object2 methodFour with param %@", obj);
}

@end
