#import <Foundation/Foundation.h>

#import "classes.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        const int ARRAY_SIZE = 3;

        NSObject* array_obj[ARRAY_SIZE];
        array_obj[0] = [[A alloc] init];
        [(A*)array_obj[0] setValue: 10];
        array_obj[1] = [[B alloc] init];
        [(A*)array_obj[1] setValue: 20];
        array_obj[2] = [[C alloc] init];
        [(A*)array_obj[2] setValue: 30];
        
        NSLog(@"array_obj:");
        for(int i=0; i<ARRAY_SIZE; ++i) {
            // cast to base class
            [(A*)array_obj[i] print];
        }

        id array_id[ARRAY_SIZE];
        array_id[0] = array_obj[0];
        array_id[1] = array_obj[1];
        array_id[2] = array_obj[2];

        [array_id[1] setValue: 100];    

        NSLog(@"array_obj:");
        for(int i=0; i<ARRAY_SIZE; ++i) {
            [(A*)array_obj[i] print];
        }

        NSLog(@"array_id:");
        for(int i=0; i<ARRAY_SIZE; ++i) {
            [(A*)array_id[i] print];
        }

        // id as pointer changed value in both arrays

        }
    return 0;
}
