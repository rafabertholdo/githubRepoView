//
//  GithubProvider.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

@import Foundation;
#import "RepositoryList.h"
#import "AFHTTPSessionManager.h"
#import "TypeDefs.h"

@interface GithubProvider : NSObject

+ (void)javaPopRepositoryListWithPage:(int)page completion:(ResponseCallbackDictionary)completion;
+ (void)pullRequequestsOfRepository:(NSString *)repositoryName owner:(NSString *)login completion:(ResponseCallbackArray)completion;

@end
