//
//  Hashids.m
//  Hashids
//
//  Created by Carl Benson on 5/20/16.
//  Copyright © 2016 Carl Benson. All rights reserved.
//

#import "Hashids.h"

@implementation Hashids

- (instancetype)initWithSalt:(NSString *)salt {
    return [self initWithSalt:salt minHashLength:0];
}

- (instancetype)initWithSalt:(NSString *)salt
               minHashLength:(NSUInteger)minHashLength {
    return [self initWithSalt:salt minHashLength:minHashLength alphabet:nil];
}

- (instancetype)initWithSalt:(NSString *)salt
               minHashLength:(NSUInteger)minHashLength
                    alphabet:(NSString *)alphabet {
    if (self = [super init]) {
        
    }
    return self;
}

- (NSString *)encode:(NSNumber *)value, ... {
    return nil;
}

- (NSArray<NSNumber *> *)decode:(NSString *)encodedValue {
    return nil;
}

@end
