//
//  NSDate+Elapsed.h
//  NSDate_Exercise
//
//  Created by Виталий Цыганенко on 11.02.2023.
//

#ifndef NSDate_Elapsed_h
#define NSDate_Elapsed_h

#import <Foundation/Foundation.h>

@interface NSDate (Elapsed)

// returns positive value if receiver is earlier than theDate
// returns negative value if receiver is later than theDate
-(NSInteger) elapsedDays1: (NSDate *) theDate;

// returns only positive values
-(NSInteger) elapsedDays2: (NSDate *) theDate;

@end

#endif /* NSDate_Elapsed_h */
