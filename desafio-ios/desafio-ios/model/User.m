//
//  User.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "User.h"
#import "TypeDefs.h"

static NSString *const kSerivceAvatarUrl = @"avatar_url";

@implementation User
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             STR_PROP(login): STR_PROP(login),
             STR_PROP(avatarUrl): kSerivceAvatarUrl
             };
}
@end
