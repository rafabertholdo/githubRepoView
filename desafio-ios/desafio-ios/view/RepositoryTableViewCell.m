//
//  RepositoryTableViewCell.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "RepositoryTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface RepositoryTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *repositoryDescription;
@property (weak, nonatomic) IBOutlet UILabel *forks;
@property (weak, nonatomic) IBOutlet UILabel *stars;
@property (weak, nonatomic) IBOutlet UIImageView *ownerAvatar;
@property (weak, nonatomic) IBOutlet UILabel *ownerLogin;

@end

@implementation RepositoryTableViewCell

-(void)setupWithModel:(Repository *)model {
    self.name.text = model.name;
    self.repositoryDescription.text = model.repositoryDescription;
    self.forks.text = @(model.forks).stringValue;
    self.stars.text = @(model.stars).stringValue;
    self.ownerLogin.text = model.owner.login;
    if (model.owner.avatarUrl) {
        [self.ownerAvatar sd_setImageWithURL:[NSURL URLWithString:model.owner.avatarUrl]
                            placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    }
}

@end
