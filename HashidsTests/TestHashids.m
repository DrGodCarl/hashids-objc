//
//  TestHashids.m
//  Hashids
//
//  Created by Carl Benson on 5/20/16.
//  Copyright © 2016 Carl Benson. All rights reserved.
//
//  Tests based off of the Swift implementation's tests:
//  https://github.com/malczak/hashids/blob/d6a446b/Tests/HashidsTests/HashidsTests.swift

#import <XCTest/XCTest.h>
#import "Hashids.h"

NSString * const SALT = @"this is my salt";

@interface TestHashids : XCTestCase

@end

@implementation TestHashids

- (void)testSimpleHash {
    Hashids *hashids = [[Hashids alloc] initWithSalt:SALT];
    NSString *result = [hashids encodeMany:@[@1, @2, @3]];
    XCTAssertEqualObjects(result, @"laHquq");
}

- (void)testSimpleRun {
    NSArray *testArray = @[@1, @2, @3];
    Hashids *hashids = [[Hashids alloc] initWithSalt:SALT];
    NSString *encoded = [hashids encodeMany:testArray];
    NSArray *decoded = [hashids decode:encoded];
    XCTAssertEqualObjects(testArray, decoded);
}

- (void)testMultipleRuns {
    NSArray *testArray = @[@1, @2, @3];
    Hashids *hashids = [[Hashids alloc] initWithSalt:SALT];
    NSString *encoded = [hashids encodeMany:testArray];
    for (int i = 0; i < 10; i++) {
        XCTAssertEqualObjects(encoded, [hashids encodeMany:testArray]);
    }
}

- (void)testKnownHashes {
    NSDictionary *knownHashes = @{@"laHquq" : @[@1, @2, @3],
                                  @"NV" : @[@1],
                                  @"xJ3MBFkB3PO" : @[@123456, @123456789],
                                  @"NZFzBrjhl" : @[@10, @123456, @1],
                                  };
    Hashids *hashids = [[Hashids alloc] initWithSalt:SALT];
    
    for (NSString *knownHash in knownHashes) {
        NSArray *values = knownHashes[knownHash];
        XCTAssertEqualObjects([hashids encodeMany:values], knownHash);
    }
}

- (void)testMinHashLength {
    NSUInteger minHashLength = 20;
    Hashids *hashids = [[Hashids alloc] initWithSalt:SALT minHashLength:minHashLength];
    for (int i = 0; i < 10; i++) {
        XCTAssertGreaterThanOrEqual([[hashids encode:@(i)] length], minHashLength);
    }
}

- (void)testInstances {
    NSArray *testArray = @[@1, @2, @3, @1000];
    Hashids *hashids1 = [[Hashids alloc] initWithSalt:SALT minHashLength:9 alphabet:@"abcdef0123456789"];
    Hashids *hashids2 = [[Hashids alloc] initWithSalt:SALT minHashLength:9 alphabet:@"abcdef0123456789"];
    XCTAssertEqualObjects([hashids1 decode:[hashids2 encodeMany:testArray]], testArray);
}

- (void)testDifferentSalts {
    NSArray *testArray = @[@1, @2, @3];
    Hashids *hashids1 = [[Hashids alloc] initWithSalt:SALT];
    Hashids *hashids2 = [[Hashids alloc] initWithSalt:[SALT stringByAppendingString:@", not!"]];
    XCTAssertNotEqualObjects([hashids1 encodeMany:testArray], [hashids2 encodeMany:testArray]);
}

- (void)testOneAndMany {
    NSNumber *testNum = @4;
    NSArray *testArray = @[testNum];
    Hashids *hashids = [[Hashids alloc] initWithSalt:SALT];
    XCTAssertEqualObjects([hashids encodeMany:testArray], [hashids encode:testNum]);
}

@end
