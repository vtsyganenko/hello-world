//
//  PersonWatcher.h
//  KVC_KVO_Example
//
//  Created by Виталий Цыганенко on 23.03.2023.
//

#ifndef PersonWatcher_h
#define PersonWatcher_h

@class Person;

@interface PersonWatcher : NSObject

-(void) watchPersonForChangeOfCity: (Person*) p;
-(void) watchPersonForChangeOfAge: (Person*) p;

-(void) removeObservablePersonsForParameterCity;
-(void) removeObservablePersonsForParameterAge;

@end

#endif /* PersonWatcher_h */
