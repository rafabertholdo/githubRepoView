//
//  GithubManager.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "GithubManager.h"
#import "GithubProvider.h"

@implementation GithubManager

+ (void)javaPopRepositoryListWithPage:(int)page completion:(JavaPopCompletion)completion {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [GithubProvider javaPopRepositoryListWithPage:page completion:^(NSDictionary *response, NSError *error) {
            RepositoryList *result = nil;
            if (!error) {
                result = [MTLJSONAdapter modelOfClass:[RepositoryList class] fromJSONDictionary:response error:&error];
            }
            dispatch_async(dispatch_get_main_queue(), ^(void){
                completion(result, error);
            });
        }];
    });
}

+ (void)pullRequequestsOfRepository:(Repository *)repository completion:(PullRequestsCompletion)completion {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [GithubProvider pullRequequestsOfRepository:repository.name owner:repository.owner.login completion:^(NSArray *responseArray, NSError *error) {
            NSArray<PullRequest *> *result;
            if (!error) {
                result = [MTLJSONAdapter modelsOfClass:[PullRequest class] fromJSONArray:responseArray error:&error];
            }
            dispatch_async(dispatch_get_main_queue(), ^(void){
                completion(result, error);
            });
        }];
    });
}

@end
