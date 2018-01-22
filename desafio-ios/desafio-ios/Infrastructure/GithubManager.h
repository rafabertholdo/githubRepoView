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

/**
 * Busca do serviço a lista dos repostórios java ordenados por número de estrelas
 * @param page página da requisição
 * @completion callback da requisição
 */
+ (void)javaPopRepositoryListWithPage:(int)page completion:(JavaPopCompletion)completion;

/**
 * Busca do serviço a lista de pull requests de um determinado repositório
 * @param repository modelo do repositório
 * @param completion callback da requisição
 */
+ (void)pullRequequestsOfRepository:(Repository *)repository completion:(PullRequestsCompletion)completion;

@end
