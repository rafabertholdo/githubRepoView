//
//  GithubManager.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

@import Foundation;
#import "TypeDefs.h"

@interface GithubManager : NSObject

+ (void)javaPopRepositoryListWithPage:(int)page completion:(JavaPopCompletion)completion;
+ (void)pullRequequestsOfRepository:(Repository *)repository completion:(PullRequestsCompletion)completion;

@end
