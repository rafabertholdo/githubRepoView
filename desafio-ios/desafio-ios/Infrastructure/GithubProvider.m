//
//  GithubProvider.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "GithubProvider.h"
#import "AFHTTPSessionManager.h"

static NSString *const kJavaPopUrl = @"https://api.github.com/search/repositories?q=language:Java&sort=stars&page=%d";
static NSString *const kPullRequestsUrl = @"https://api.github.com/repos/%@/%@/pulls";
static NSString *const kUnexpectedServiceResultMessage = @"Unexpected service result";
static NSString *const kErrorDomain = @"GithubDomain";

@implementation GithubProvider

+ (void)javaPopRepositoryListWithPage:(int)page completion:(ResponseCallbackDictionary)completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[NSString stringWithFormat:kJavaPopUrl, page]
      parameters:nil
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             if ([responseObject isKindOfClass:[NSDictionary class]]) {
                 completion((NSDictionary *)responseObject, nil);
             } else {
                 completion(nil, [NSError errorWithDomain:kErrorDomain code:1 userInfo:@{NSLocalizedDescriptionKey : kUnexpectedServiceResultMessage }]);
             }
         }
         failure:^(NSURLSessionTask *operation, NSError *error) {
             completion(nil, error);
         }
     ];
}


+ (void)pullRequequestsOfRepository:(NSString *)repositoryName owner:(NSString *)login completion:(ResponseCallbackArray)completion {
    
    NSString *stringUrl = [NSString stringWithFormat:kPullRequestsUrl, login, repositoryName];
    
    NSURL *URL = [NSURL URLWithString:stringUrl];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString
      parameters:nil
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             if ([responseObject isKindOfClass:[NSArray class]]) {
                 completion((NSArray *)responseObject, nil);
             } else {
                 completion(nil, [NSError errorWithDomain:kErrorDomain code:1 userInfo:@{NSLocalizedDescriptionKey : kUnexpectedServiceResultMessage }]);
             }
         }
         failure:^(NSURLSessionTask *operation, NSError *error) {
             completion(nil, error);
         }
     ];
}

@end
