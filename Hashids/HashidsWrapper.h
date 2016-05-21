//
//  Hashids.h
//  Hashids
//
//  Created by Carl Benson on 5/20/16.
//  Copyright © 2016 Carl Benson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashidsWrapper : NSObject

- (instancetype)initWithSalt:(NSString *)salt;

- (instancetype)initWithSalt:(NSString *)salt
               minHashLength:(uint32_t)minHashLength;

- (instancetype)initWithSalt:(NSString *)salt
               minHashLength:(uint32_t)minHashLength
                    alphabet:(NSString *)alphabet;

- (NSString *)encode:(NSNumber *)value;
- (NSString *)encodeMany:(NSArray<NSNumber*> *)values;

- (NSArray<NSNumber*> *)decode:(NSString *)encodedValue;

@end
