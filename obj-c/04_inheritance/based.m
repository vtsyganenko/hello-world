#import "based.h"

@implementation Based
{
    int y; // "private"
}

@synthesize coef;

-(id) init {
    if(self = [super init]) {
        x = 1;
        y = 11;
        coef = 100.1; // _coef without @synthesize
    }
    return self;
}

-(void) hello {
    NSLog(@"Hello from Based class");
}

-(void) printData {
    NSLog(@"data: x:%d y:%d coef:%f", x, y, coef);
}

@end