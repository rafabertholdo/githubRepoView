//
//  PullRequestTableViewCell.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullRequest.h"

@interface PullRequestTableViewCell : UITableViewCell

/**
 * Define os dados na célula de pull request a partir do modelo
 * @param model modelo do pull request
 */
- (void)setupWithModel:(PullRequest *)model;

@end
