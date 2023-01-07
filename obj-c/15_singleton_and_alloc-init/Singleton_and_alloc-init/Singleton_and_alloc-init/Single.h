//
//  Single.h
//  Singleton_and_alloc-init
//
//  Created by Виталий Цыганенко on 07.01.2023.
//

#ifndef Single_h
#define Single_h

#import <Foundation/Foundation.h>

@interface SingletonA : NSObject
@property int value;
+(instancetype) getInstance;
@end


@interface SingletonB : NSObject
@property int value;
+(instancetype) getInstance;
@end


@interface MySingleton : NSObject
@property int value;
@end

#endif /* Single_h */
