//
//  User.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

@import Foundation;
#import "Mantle.h"

@interface User : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *avatarUrl;
@end
