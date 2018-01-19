//
//  RepositoryList.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

@import Foundation;
#import "Mantle.h"
#import "Repository.h"

@interface RepositoryList : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSArray<Repository *> *items;
@end
