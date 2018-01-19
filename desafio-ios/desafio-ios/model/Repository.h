//
//  Repository.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

@import Foundation;
#import "Mantle.h"
#import "User.h"

@interface Repository : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *repositoryDescription;
@property (nonatomic, assign) NSUInteger forks;
@property (nonatomic, assign) NSUInteger stars;
@property (nonatomic, strong) User *owner;

@end
