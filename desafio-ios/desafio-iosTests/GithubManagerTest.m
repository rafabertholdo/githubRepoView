//
//  GithubManagerTest.m
//  desafio-iosTests
//
//  Created by Rafael Guilherme Bertholdo on 22/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GithubManager.h"
#import <OCMock.h>
#import "GithubProvider.h"
#import "MTLJSONAdapter.h"

@interface GithubManagerTest : XCTestCase
@property (nonatomic, strong) id githubProviderMock;
@property (nonatomic, strong) id mantleMock;
@end

@implementation GithubManagerTest

- (void)setUp {
    [super setUp];
    self.githubProviderMock = OCMClassMock([GithubProvider class]);
    self.mantleMock = OCMClassMock([MTLJSONAdapter class]);
}

- (void)tearDown {
    [super tearDown];
    [self.githubProviderMock stopMocking];
    [self.mantleMock stopMocking];
}

- (void)testJavaPopRepositoryListSuccess {
    NSDictionary *providerResponse = @{};
    
    RepositoryList *list = [RepositoryList new];
    
    NSError *error;
    OCMStub([self.mantleMock modelOfClass:[RepositoryList class]
                       fromJSONDictionary:providerResponse
                                    error:[OCMArg setTo:error]]).andReturn(list);
    
    OCMStub([self.githubProviderMock javaPopRepositoryListWithPage:1
                                                        completion:([OCMArg invokeBlockWithArgs:providerResponse, [NSNull null], nil])]);
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing Async Method Works!"];
    
    [GithubManager javaPopRepositoryListWithPage:1
                                      completion:^(RepositoryList *repositoryList, NSError *error) {
        XCTAssertEqual(repositoryList, list);
        XCTAssertNil(error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if(error) {
            XCTFail(@"Expectation Failed with error: %@", error);
        }        
    }];
}

- (void)testJavaPopRepositoryListServiceError {
    NSError *serviceError = [NSError new];
    
    OCMStub([self.githubProviderMock javaPopRepositoryListWithPage:1
                                                        completion:([OCMArg invokeBlockWithArgs:[NSNull null], serviceError, nil])]);
    
    OCMStub([self.mantleMock modelOfClass:[RepositoryList class]
                       fromJSONDictionary:[OCMArg any]
                                    error:[OCMArg setTo:serviceError]]).andReturn(nil);
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing Async Method Works!"];
    
    [GithubManager javaPopRepositoryListWithPage:1
                                      completion:^(RepositoryList *repositoryList, NSError *error) {
         XCTAssertNil(repositoryList);
         XCTAssertEqual(error, serviceError);
         [expectation fulfill];
     }];
    
    OCMReject([self.mantleMock modelOfClass:[RepositoryList class]
                         fromJSONDictionary:[OCMArg any]
                                      error:[OCMArg setTo:serviceError]]);
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if(error) {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
    }];
}

- (void)testJavaPopRepositoryListParserError {
    NSDictionary *providerResponse = @{};
    NSError *serviceError = [NSError new];
    
    OCMStub([self.githubProviderMock javaPopRepositoryListWithPage:1
                                                        completion:([OCMArg invokeBlockWithArgs:providerResponse, [NSNull null], nil])]);
    
    OCMStub([self.mantleMock modelOfClass:[RepositoryList class]
                       fromJSONDictionary:[OCMArg any]
                                    error:[OCMArg setTo:serviceError]]).andReturn(nil);
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Testing Async Method Works!"];
    
    [GithubManager javaPopRepositoryListWithPage:1
                                      completion:^(RepositoryList *repositoryList, NSError *error) {
                                          XCTAssertNil(repositoryList);
                                          XCTAssertEqual(error, serviceError);
                                          [expectation fulfill];
                                      }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if(error) {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
    }];
}

@end
