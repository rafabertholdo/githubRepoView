//
//  PullRequest.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"
#import "User.h"

@interface PullRequest : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *htmlUrl;
@end
