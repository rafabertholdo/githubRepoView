//
//  Repository.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "Repository.h"

@implementation Repository

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"name",
             @"repositoryDescription": @"description",
             @"forks": @"forks_count",
             @"stars": @"stargazers_count",
             @"owner": @"owner"
             };
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[User class]];
}

@end
