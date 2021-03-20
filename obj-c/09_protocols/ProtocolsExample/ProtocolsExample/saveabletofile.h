//
//  saveabletofile.h
//  ProtocolsExample
//
//  Created by Виталий Цыганенко on 24/05/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#ifndef saveabletofile_h
#define saveabletofile_h

@protocol SaveableToFile

-(BOOL) saveToFile: (NSString*) fileName;

@optional

-(void) printSaveableInfo;

@end

#endif /* saveabletofile_h */
