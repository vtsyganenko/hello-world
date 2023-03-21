//
//  Person.h
//  KVC_KVO_Example
//
//  Created by Виталий Цыганенко on 21.03.2023.
//

#ifndef Person_h
#define Person_h

@interface Person : NSObject

@property (nonatomic, strong) NSString* name;

@property (nonatomic, weak) Person* spouse;

@end

#endif /* Person_h */
