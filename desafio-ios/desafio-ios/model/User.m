//
//  User.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "User.h"

@implementation User
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"login": @"login",
             @"avatarUrl": @"avatar_url"
             };
}
@end
