//
//  TestHashids.m
//  Hashids
//
//  Created by Carl Benson on 5/20/16.
//  Copyright © 2016 Carl Benson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Hashids.h"

@interface TestHashids : XCTestCase

@end

@implementation TestHashids

- (void)testSimpleHash {
    Hashids *hashids = [[Hashids alloc] initWithSalt:@"this is my salt"];
    NSString *result = [hashids encode:@1, @2, @3, nil];
    XCTAssertEqualObjects(result, @"laHquq");
}

@end
