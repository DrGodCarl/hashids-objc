//
//  Hashids.h
//  Hashids
//
//  Created by Carl Benson on 5/20/16.
//  Copyright © 2016 Carl Benson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hashids : NSObject

- (instancetype)initWithSalt:(NSString *)salt;

- (instancetype)initWithSalt:(NSString *)salt
               minHashLength:(NSUInteger)minHashLength;

- (instancetype)initWithSalt:(NSString *)salt
               minHashLength:(NSUInteger)minHashLength
                    alphabet:(NSString *)alphabet;

- (NSString *)encode:(NSNumber *)value;
- (NSString *)encodeMany:(NSArray<NSNumber*> *)values;

- (NSArray<NSNumber*> *)decode:(NSString *)encodedValue;

@end
