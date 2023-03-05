//
//  MyMutableArray.h
//  ManualRetainRelease4
//
//  Created by Виталий Цыганенко on 05.03.2023.
//

#ifndef MyMutableArray_h
#define MyMutableArray_h

// class inherits to NSMutableArray class
// contains "id" value to distinct different objects
// contains log message within dealloc method
@interface MyMutableArray : NSMutableArray
-(void) setValue: (int) value;
@end

#endif /* MyMutableArray_h */
