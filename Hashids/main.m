//
//  main.m
//  Hashids
//
//  Created by Carl Benson on 5/20/16.
//  Copyright © 2016 Carl Benson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NNLHashids.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NNLHashids *ids = [[NNLHashids alloc] initWithSalt:@"hello"];
        NSString *name = [ids encode:@1];
        NSLog(name);
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
