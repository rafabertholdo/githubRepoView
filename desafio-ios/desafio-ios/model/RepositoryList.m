//
//  RepositoryList.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "RepositoryList.h"
#import "TypeDefs.h"

@implementation RepositoryList

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             STR_PROP(items): STR_PROP(items)
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Repository class]];
}

@end
