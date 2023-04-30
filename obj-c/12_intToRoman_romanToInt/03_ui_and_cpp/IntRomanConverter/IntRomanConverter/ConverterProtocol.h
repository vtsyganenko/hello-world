//
//  ConverterProtocol.h
//  IntRomanConverter
//
//  Created by Виталий Цыганенко on 30.04.2023.
//

#ifndef ConverterProtocol_h
#define ConverterProtocol_h

@class ConverterWrapper;

@protocol ConverterProtocol
@property (nonatomic, weak) ConverterWrapper* converter;
@end

#endif /* ConverterProtocol_h */
