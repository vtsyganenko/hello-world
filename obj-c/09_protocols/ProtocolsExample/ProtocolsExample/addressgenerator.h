//
//  addressgenerator.h
//  ProtocolsExample
//
//  Created by Виталий Цыганенко on 24/05/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#ifndef adressgenerator_h
#define adressgenerator_h

#import <Foundation/Foundation.h>

#import "saveabletofile.h"

@interface AddressGenerator : NSObject <SaveableToFile>

@property (nonatomic, copy) NSString* country;
@property (nonatomic, copy) NSString* region;
@property (nonatomic, copy) NSString* city;
@property (nonatomic, copy) NSString* street;

// "Country: (Region) City, Street"
-(NSString*) generate;

@end

#endif /* adressgenerator_h */
