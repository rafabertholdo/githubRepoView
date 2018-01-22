//
//  desafio_iosUITests.m
//  desafio-iosUITests
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface desafio_iosUITests : XCTestCase

@end

@implementation desafio_iosUITests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    [super tearDown];
}

@end
