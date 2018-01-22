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

/**
 * Busca do serviço a lista dos repostórios java ordenados por número de estrelas
 * @param page página da requisição
 * @completion callback da requisição
 */
+ (void)javaPopRepositoryListWithPage:(int)page completion:(ResponseCallbackDictionary)completion;

/**
 * Busca do serviço a lista de pull requests de um determinado repositório
 * @param repositoryName nome do repositório
 * @param owner login do usuário criador do repositório
 * @param completion callback da requisição
 */
+ (void)pullRequequestsOfRepository:(NSString *)repositoryName owner:(NSString *)login completion:(ResponseCallbackArray)completion;

@end
