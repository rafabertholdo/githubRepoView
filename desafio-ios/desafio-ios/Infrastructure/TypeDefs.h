//
//  TypeDefs.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#ifndef TypeDefs_h
#define TypeDefs_h
@import Foundation;
#import "RepositoryList.h"
#import "PullRequest.h"

#ifndef STR_PROP
#define STR_PROP( prop ) NSStringFromSelector(@selector(prop))
#endif

typedef void (^JavaPopCompletion)(RepositoryList *repositoryList, NSError *error);
typedef void (^PullRequestsCompletion)(NSArray<PullRequest *> *pullRequests, NSError *error);
typedef void (^ResponseCallbackArray)(NSArray *responseArray, NSError *error);
typedef void (^ResponseCallbackDictionary)(NSDictionary *response, NSError *error);
typedef void (^JavaPopControllerCompletion)(void);

#endif /* TypeDefs_h */
