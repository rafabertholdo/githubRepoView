//
//  RepositoryTableViewCell.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

@import UIKit;
#import "Repository.h"

@interface RepositoryTableViewCell : UITableViewCell

/**
 * Define os dados na célula de repositório a partir do modelo
 * @param model modelo do repositório
 */
- (void)setupWithModel:(Repository *)model;

@end
