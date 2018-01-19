//
//  PullRequestTableViewCell.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "PullRequestTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface PullRequestTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *userLogin;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;
@property (weak, nonatomic) IBOutlet UILabel *body;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *createdAt;

@end

@implementation PullRequestTableViewCell

-(void)setupWithModel:(PullRequest *)model {
    self.userLogin.text = model.user.login;
    self.title.text = model.title;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/YYYY HH:mm:ss"];
    self.createdAt.text = [dateFormatter stringFromDate:model.createdAt];
    self.body.text = model.body;
    
    if (model.user.avatarUrl) {
        [self.userAvatar sd_setImageWithURL:[NSURL URLWithString:model.user.avatarUrl]
                            placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    }
    
}

@end
