//
//  GithubProviderTest.m
//  desafio-iosTests
//
//  Created by Rafael Guilherme Bertholdo on 22/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock.h>
#import "GithubProvider.h"
#import "AFHTTPSessionManager.h"

static NSString *const kUnexpectedServiceResultMessage = @"Unexpected service result";

@interface GithubProviderTest : XCTestCase
@property (nonatomic, strong) id sessionManagerMock;
@end

@implementation GithubProviderTest

- (void)setUp {
    [super setUp];
    self.sessionManagerMock = OCMClassMock([AFHTTPSessionManager class]);
    OCMStub(ClassMethod([self.sessionManagerMock manager])).andReturn(self.sessionManagerMock);
}

- (void)tearDown {
    [super tearDown];
    [self.sessionManagerMock stopMocking];
}

- (void)testJavaPopRepositoryListSuccess {
    NSURLSessionTask *task = [NSURLSessionTask new];
    id responseObject = @{};
    NSString *request = @"https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1";
    OCMStub([self.sessionManagerMock GET:[OCMArg any]
                              parameters:[OCMArg any]
                                progress:[OCMArg any]
                                 success:([OCMArg invokeBlockWithArgs:task, responseObject,nil])
                                 failure:[OCMArg any]]);
    [GithubProvider javaPopRepositoryListWithPage:1 completion:^(NSDictionary *response, NSError *error) {
        XCTAssertEqual(response, responseObject);
        XCTAssertNil(error);
    }];

    OCMVerify([self.sessionManagerMock GET:request
                                parameters:nil
                                  progress:nil
                                   success:([OCMArg invokeBlockWithArgs:task, responseObject,nil])
                                   failure:[OCMArg any]]);
}

- (void)testJavaPopRepositoryListInvalidResult {
    NSURLSessionTask *task = [NSURLSessionTask new];
    id responseObject = @[];
    OCMStub([self.sessionManagerMock GET:[OCMArg any]
                              parameters:[OCMArg any]
                                progress:[OCMArg any]
                                 success:([OCMArg invokeBlockWithArgs:task, responseObject,nil])
                                 failure:[OCMArg any]]);
    [GithubProvider javaPopRepositoryListWithPage:1 completion:^(NSDictionary *response, NSError *error) {
        XCTAssertNil(response);
        XCTAssertEqualObjects(error.localizedDescription, kUnexpectedServiceResultMessage);
    }];
}

- (void)testJavaPopRepositoryListServiceError {
    NSURLSessionTask *task = [NSURLSessionTask new];
    NSError *serviceError = [NSError new];
    OCMStub([self.sessionManagerMock GET:[OCMArg any]
                              parameters:[OCMArg any]
                                progress:[OCMArg any]
                                 success:[OCMArg any]
                                 failure:([OCMArg invokeBlockWithArgs:task, serviceError,nil])]);
    [GithubProvider javaPopRepositoryListWithPage:1 completion:^(NSDictionary *response, NSError *error) {
        XCTAssertNil(response);
        XCTAssertEqual(serviceError, error);
    }];
}

- (void)testPullRequequestsOfRepositorySuccess {
    NSURLSessionTask *task = [NSURLSessionTask new];
    id responseObject = @[];
    NSString *request = @"https://api.github.com/repos/rafabertholdo/nesemu/pulls";
    OCMStub([self.sessionManagerMock GET:[OCMArg any]
                              parameters:[OCMArg any]
                                progress:[OCMArg any]
                                 success:([OCMArg invokeBlockWithArgs:task, responseObject,nil])
                                 failure:[OCMArg any]]);
    [GithubProvider pullRequequestsOfRepository:@"nesemu"
                                          owner:@"rafabertholdo"
                                     completion:^(NSArray *responseArray, NSError *error) {
         XCTAssertEqual(responseArray, responseObject);
         XCTAssertNil(error);
     }];
    
    OCMVerify([self.sessionManagerMock GET:request
                                parameters:nil
                                  progress:nil
                                   success:([OCMArg invokeBlockWithArgs:task, responseObject,nil])
                                   failure:[OCMArg any]]);
}

- (void)testPullRequequestsOfRepositoryInvalidResult {
    NSURLSessionTask *task = [NSURLSessionTask new];
    id responseObject = @{};
    OCMStub([self.sessionManagerMock GET:[OCMArg any]
                              parameters:[OCMArg any]
                                progress:[OCMArg any]
                                 success:([OCMArg invokeBlockWithArgs:task, responseObject,nil])
                                 failure:[OCMArg any]]);
    
    [GithubProvider pullRequequestsOfRepository:@"nesemu"
                                          owner:@"rafabertholdo"
                                     completion:^(NSArray *responseArray, NSError *error) {
        XCTAssertNil(responseArray);
        XCTAssertEqualObjects(error.localizedDescription, kUnexpectedServiceResultMessage);
    }];
}

- (void)testPullRequequestsOfRepositoryServiceError {
    NSURLSessionTask *task = [NSURLSessionTask new];
    NSError *serviceError = [NSError new];
    OCMStub([self.sessionManagerMock GET:[OCMArg any]
                              parameters:[OCMArg any]
                                progress:[OCMArg any]
                                 success:[OCMArg any]
                                 failure:([OCMArg invokeBlockWithArgs:task, serviceError,nil])]);
    
    [GithubProvider pullRequequestsOfRepository:@"nesemu"
                                          owner:@"rafabertholdo"
                                     completion:^(NSArray *responseArray, NSError *error) {
                                         XCTAssertNil(responseArray);
                                         XCTAssertEqual(serviceError, error);
                                     }];
}

@end
