//
//  main.m
//  NSValueExample
//
//  Created by Виталий Цыганенко on 31.01.2023.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        CGPoint p1;
        p1.x = 100;
        p1.y = 200;
        NSValue* obj1 = [NSValue valueWithPoint:p1];
        
        CGPoint p2 = CGPointMake(300, 400);
        NSValue* obj2 = [NSValue valueWithPoint:p2];
        
        NSMutableArray* arr = [NSMutableArray arrayWithObjects:obj1, obj2, nil];
        NSLog(@"array with two NSValue:%@", arr);
        
        // p1.x = 155; doesn't change data in array
        
        // unwrapping
        CGPoint p3 = [arr[1] pointValue];
        NSLog(@"retrieved value p3 (%f, %f)", p3.x, p3.y);
        NSLog(@" ");
        
        
        // user structure
        struct Data {
            int value;
            double coef;
        };
        struct Data d1 = { 10, 45.6 };
        obj1 = [NSValue value: &d1 withObjCType: @encode(struct Data)];
        
        struct Data d2 = { 80, -0.6 };
        obj2 = [NSValue value: &d2 withObjCType: @encode(struct Data)];
        
        arr = [NSMutableArray arrayWithObjects:obj1, obj2, nil];
        NSLog(@"array with two user NSValue: %@", arr);
        
        NSLog(@"let's print array manually:");
        [arr enumerateObjectsUsingBlock: ^void(id obj, NSUInteger idx, BOOL* stop) {
            struct Data tmp;
            [obj getValue: &tmp];
            NSLog(@"[%lu] value %d coef %f", idx, tmp.value, tmp.coef);
        }];
        

    }
    return 0;
}
