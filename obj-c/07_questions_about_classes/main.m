#import "classes.h"

#import <Foundation/Foundation.h>

NSString* boolToStr(BOOL flag)
{
    if(flag)
        return @"YES";
    else
        return @"NO";
}

void none()
{
    NSLog(@"none");
}

SEL getAppropriateSelector(id object) 
{
    if([object isMemberOfClass: [ClassA class]] == YES) {
        return @selector (method1);
    }
    if([object isMemberOfClass: [ClassC class]] == YES) {
        return @selector (method4);
    }
    return @selector (none);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ClassA* a = [[ClassA alloc] init];
        ClassB* b = [[ClassB alloc] init];
        ClassC* c = [[ClassC alloc] init];
        
        // isKindOfClass
        NSLog(@"object a isKindOfClass NSObject is %@", boolToStr([a isKindOfClass: [NSObject class]]));
        NSLog(@"object b isKindOfClass NSObject is %@", boolToStr([b isKindOfClass: [NSObject class]]));
        NSLog(@"object c isKindOfClass NSObject is %@", boolToStr([c isKindOfClass: [NSObject class]]));
        NSLog(@"object a isKindOfClass a is %@", boolToStr([a isKindOfClass: [a class]]));
        NSLog(@"object a isKindOfClass b is %@", boolToStr([a isKindOfClass: [b class]]));
        NSLog(@"object a isKindOfClass c is %@", boolToStr([a isKindOfClass: [c class]]));
        NSLog(@"object b isKindOfClass a is %@", boolToStr([b isKindOfClass: [a class]]));
        NSLog(@"object c isKindOfClass a is %@", boolToStr([c isKindOfClass: [a class]]));
        NSLog(@"object c isKindOfClass b is %@", boolToStr([c isKindOfClass: [b class]]));
        NSLog(@" ");
        
        // isMemberOfClass
        NSLog(@"object a isMemberOfClass NSObject is %@", boolToStr([a isMemberOfClass: [NSObject class]]));
        NSLog(@"object b isMemberOfClass NSObject is %@", boolToStr([b isMemberOfClass: [NSObject class]]));
        NSLog(@"object c isMemberOfClass NSObject is %@", boolToStr([b isMemberOfClass: [NSObject class]]));
        NSLog(@"object a isMemberOfClass a is %@", boolToStr([a isMemberOfClass: [a class]]));
        NSLog(@"object b isMemberOfClass a is %@", boolToStr([b isMemberOfClass: [a class]]));
        NSLog(@"object c isMemberOfClass a is %@", boolToStr([c isMemberOfClass: [a class]]));
        NSLog(@"object a isMemberOfClass b is %@", boolToStr([a isMemberOfClass: [b class]]));
        NSLog(@"object b isMemberOfClass b is %@", boolToStr([b isMemberOfClass: [b class]]));
        NSLog(@"object c isMemberOfClass b is %@", boolToStr([c isMemberOfClass: [b class]]));
        NSLog(@"object a isMemberOfClass c is %@", boolToStr([a isMemberOfClass: [c class]]));
        NSLog(@"object b isMemberOfClass c is %@", boolToStr([b isMemberOfClass: [c class]]));
        NSLog(@"object c isMemberOfClass c is %@", boolToStr([c isMemberOfClass: [c class]]));
        NSLog(@" ");
        
        // respondsToSelector
        // for instances about "-"
        NSLog(@"Call respondsToSelector for object (ask about instance methods \"-\"):");
        NSLog(@"object a respondsToSelector method1 is %@", boolToStr([a respondsToSelector: @selector (method1)]));
        NSLog(@"object a respondsToSelector method2 is %@", boolToStr([a respondsToSelector: @selector (method2:)]));
        NSLog(@"object a respondsToSelector method3 is %@", boolToStr([a respondsToSelector: @selector (method3:andOther:)]));
        NSLog(@"object b respondsToSelector method1 is %@", boolToStr([b respondsToSelector: @selector (method1)]));
        NSLog(@"object b respondsToSelector method2 is %@", boolToStr([b respondsToSelector: @selector (method2:)]));
        NSLog(@"object b respondsToSelector method3 is %@", boolToStr([b respondsToSelector: @selector (method3:andOther:)]));
        NSLog(@"object c respondsToSelector method1 is %@", boolToStr([c respondsToSelector: @selector (method1)]));
        NSLog(@"object c respondsToSelector method2 is %@", boolToStr([c respondsToSelector: @selector (method2:)]));
        NSLog(@"object c respondsToSelector method3 is %@", boolToStr([c respondsToSelector: @selector (method3:andOther:)]));
        // for instances about "+"
        NSLog(@"Call respondsToSelector for object (ask about class (i.e. static) methods \"+\"):");
        NSLog(@"object a respondsToSelector staticMethod is %@", boolToStr([a respondsToSelector: @selector (staticMethod)]));
        NSLog(@"object b respondsToSelector staticMethod is %@", boolToStr([b respondsToSelector: @selector (staticMethod)]));
        NSLog(@"object c respondsToSelector staticMethod is %@", boolToStr([c respondsToSelector: @selector (staticMethod)]));
        // for classes about "-"
        NSLog(@"Call respondsToSelector for class (ask about instance methods \"-\"):");
        NSLog(@"ClassA respondsToSelector method1 is %@", boolToStr([ClassA respondsToSelector: @selector (method1)]));
        NSLog(@"ClassA respondsToSelector method2 is %@", boolToStr([ClassA respondsToSelector: @selector (method2:)]));
        NSLog(@"ClassA respondsToSelector method3 is %@", boolToStr([ClassA respondsToSelector: @selector (method3:andOther:)]));
        NSLog(@"ClassB respondsToSelector method1 is %@", boolToStr([ClassB respondsToSelector: @selector (method1)]));
        NSLog(@"ClassB respondsToSelector method2 is %@", boolToStr([ClassB respondsToSelector: @selector (method2:)]));
        NSLog(@"ClassB respondsToSelector method3 is %@", boolToStr([ClassB respondsToSelector: @selector (method3:andOther:)]));
        NSLog(@"ClassC respondsToSelector method1 is %@", boolToStr([ClassC respondsToSelector: @selector (method1)]));
        NSLog(@"ClassC respondsToSelector method2 is %@", boolToStr([ClassC respondsToSelector: @selector (method2:)]));
        NSLog(@"ClassC respondsToSelector method3 is %@", boolToStr([ClassC respondsToSelector: @selector (method3:andOther:)]));        
        // for classes about "+"
        NSLog(@"Call respondsToSelector for class (ask about class (i.e. static) methods \"+\"):");
        NSLog(@"ClassA respondsToSelector staticMethod is %@", boolToStr([ClassA respondsToSelector: @selector (staticMethod)]));
        NSLog(@"ClassB respondsToSelector staticMethod is %@", boolToStr([ClassB respondsToSelector: @selector (staticMethod)]));
        NSLog(@"ClassC respondsToSelector staticMethod is %@", boolToStr([ClassC respondsToSelector: @selector (staticMethod)]));
        NSLog(@" ");

        // instancesRespondToSelector only for classes (+)
        NSLog(@"(-)");
        NSLog(@"ClassA instancesRespondToSelector method1 is %@", boolToStr([ClassA instancesRespondToSelector: @selector (method1)]));
        NSLog(@"ClassA instancesRespondToSelector method2 is %@", boolToStr([ClassA instancesRespondToSelector: @selector (method2:)]));
        NSLog(@"ClassA instancesRespondToSelector method3 is %@", boolToStr([ClassA instancesRespondToSelector: @selector (method3:andOther:)]));
        NSLog(@"ClassB instancesRespondToSelector method1 is %@", boolToStr([ClassB instancesRespondToSelector: @selector (method1)]));
        NSLog(@"ClassB instancesRespondToSelector method2 is %@", boolToStr([ClassB instancesRespondToSelector: @selector (method2:)]));
        NSLog(@"ClassB instancesRespondToSelector method3 is %@", boolToStr([ClassB instancesRespondToSelector: @selector (method3:andOther:)]));
        NSLog(@"ClassC instancesRespondToSelector method1 is %@", boolToStr([ClassC instancesRespondToSelector: @selector (method1)]));
        NSLog(@"ClassC instancesRespondToSelector method2 is %@", boolToStr([ClassC instancesRespondToSelector: @selector (method2:)]));
        NSLog(@"ClassC instancesRespondToSelector method3 is %@", boolToStr([ClassC instancesRespondToSelector: @selector (method3:andOther:)]));
        NSLog(@"ClassA instancesRespondToSelector staticMethod is %@", boolToStr([ClassA instancesRespondToSelector: @selector (staticMethod)]));
        NSLog(@"ClassB instancesRespondToSelector staticMethod is %@", boolToStr([ClassB instancesRespondToSelector: @selector (staticMethod)]));
        NSLog(@"ClassC instancesRespondToSelector staticMethod is %@", boolToStr([ClassC instancesRespondToSelector: @selector (staticMethod)]));
        NSLog(@"(+)");
        NSLog(@"ClassA instancesRespondToSelector staticMethod is %@", boolToStr([ClassA instancesRespondToSelector: @selector (staticMethod)]));
        NSLog(@"ClassB instancesRespondToSelector staticMethod is %@", boolToStr([ClassB instancesRespondToSelector: @selector (staticMethod)]));
        NSLog(@"ClassC instancesRespondToSelector staticMethod is %@", boolToStr([ClassC instancesRespondToSelector: @selector (staticMethod)]));
        NSLog(@" ");
        
        // isSubclassOfClass only for classes (+)
        NSLog(@"ClassA isSubclassOfClass NSObject is %@", boolToStr([ClassA isSubclassOfClass: [NSObject class]]));
        NSLog(@"ClassB isSubclassOfClass NSObject is %@", boolToStr([ClassB isSubclassOfClass: [NSObject class]]));
        NSLog(@"ClassC isSubclassOfClass NSObject is %@", boolToStr([ClassC isSubclassOfClass: [NSObject class]]));
        NSLog(@"ClassA isSubclassOfClass ClassA is %@", boolToStr([ClassA isSubclassOfClass: [ClassA class]]));
        NSLog(@"ClassB isSubclassOfClass ClassA is %@", boolToStr([ClassB isSubclassOfClass: [ClassA class]]));
        NSLog(@"ClassC isSubclassOfClass ClassA is %@", boolToStr([ClassC isSubclassOfClass: [ClassA class]]));
        
        // performSelector
        SEL action = getAppropriateSelector(a);
        [a performSelector: action];
        action = getAppropriateSelector(c);
        [c performSelector: action];

        NSLog(@" ");
        NSLog(@"end!");
    }
    return 0;
}
