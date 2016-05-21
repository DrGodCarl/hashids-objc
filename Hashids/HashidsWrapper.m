//
//  Hashids.m
//  Hashids
//
//  Created by Carl Benson on 5/20/16.
//  Copyright © 2016 Carl Benson. All rights reserved.
//

#import "HashidsWrapper.h"
#include "hashids.c/hashids.h"

@interface HashidsWrapper ()

@property (nonatomic) struct hashids_t *hashid;

@end

@implementation HashidsWrapper

- (instancetype)initWithSalt:(NSString *)salt {
    if (self = [super init]) {
        salt = salt ?: @"";
        const char *cSalt = [salt cStringUsingEncoding:NSASCIIStringEncoding];
        self.hashid = hashids_init(cSalt);
    }
    return self;
}

- (instancetype)initWithSalt:(NSString *)salt
               minHashLength:(uint32_t)minHashLength {
    if (self = [super init]) {
        salt = salt ?: @"";
        const char *cSalt = [salt cStringUsingEncoding:NSASCIIStringEncoding];
        self.hashid = hashids_init2(cSalt, minHashLength);
    }
    return self;
}

- (instancetype)initWithSalt:(NSString *)salt
               minHashLength:(uint32_t)minHashLength
                    alphabet:(NSString *)alphabet {
    if (self = [super init]) {
        alphabet = alphabet ?: @"";
        salt = salt ?: @"";
        const char *cSalt = [salt cStringUsingEncoding:NSASCIIStringEncoding];
        const char *cAlphabet = [alphabet cStringUsingEncoding:NSASCIIStringEncoding];
        self.hashid = hashids_init3(cSalt, minHashLength, cAlphabet);
    }
    return self;
}

- (void)dealloc {
    if (self.hashid) {
        hashids_free(self.hashid);
    }
}

- (NSString *)encode:(NSNumber *)value {
    return [self encodeMany:@[value]];
}

- (NSString *)encodeMany:(NSArray<NSNumber*> *)values {
    uint32_t count = (uint32_t)[values count];
    unsigned long long vals[count];
    for (int i = 0; i < count; i++) {
        unsigned long long value = [values[i] unsignedLongLongValue];
        vals[i] = value;
    }
    uint32_t estimation = hashids_estimate_encoded_size(self.hashid, count, vals);
    char buffer[estimation];
    if (hashids_encode(self.hashid, buffer, (uint32_t)[values count], vals)) {
        return [NSString stringWithCString:buffer encoding:NSASCIIStringEncoding];
    }
    return nil;
}

- (NSArray<NSNumber *> *)decode:(NSString *)encodedValue {
    const char * cEncodedValue = [encodedValue cStringUsingEncoding:NSASCIIStringEncoding];
    uint32_t numberCount = hashids_numbers_count(self.hashid, (char *)cEncodedValue);
    unsigned long long numbers[numberCount];
    unsigned int resultCount = hashids_decode(self.hashid, (char *)cEncodedValue, numbers);
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:resultCount];
    for (int i = 0; i < resultCount; i++) {
        [result addObject:@(numbers[i])];
    }
    return [result copy];
}

@end
