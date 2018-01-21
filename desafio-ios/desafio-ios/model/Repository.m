//
//  Repository.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "Repository.h"
#import "TypeDefs.h"

static NSString *const kSeviceDescription = @"description";
static NSString *const kSeviceForksCount = @"forks_count";
static NSString *const kSeviceStargazersCount = @"stargazers_count";

@implementation Repository

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             STR_PROP(name): STR_PROP(name),
             STR_PROP(repositoryDescription): kSeviceDescription,
             STR_PROP(forks): kSeviceForksCount,
             STR_PROP(stars): kSeviceStargazersCount,
             STR_PROP(owner): STR_PROP(owner)
             };
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[User class]];
}

@end
