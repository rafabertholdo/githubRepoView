//
//  PullRequestTableViewCell.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "PullRequestTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <TSMarkdownParser/TSMarkdownParser.h>

static NSString *const kPlaceholderImageName = @"placeholder.png";
static NSString *const kDatePattend = @"dd/MM/YYYY HH:mm:ss";

@interface PullRequestTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *userLogin;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;
@property (weak, nonatomic) IBOutlet UILabel *body;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *createdAt;

@end

@implementation PullRequestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layoutMargins = UIEdgeInsetsZero;
    self.separatorInset = UIEdgeInsetsZero;
}

-(void)setupWithModel:(PullRequest *)model {
    self.userLogin.text = model.user.login;
    self.title.text = model.title;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:kDatePattend];
    self.createdAt.text = [dateFormatter stringFromDate:model.createdAt];
    if (model.body) {
        self.body.attributedText = [[TSMarkdownParser standardParser] attributedStringFromMarkdown:model.body];
    }
    
    if (model.user.avatarUrl) {
        [self.userAvatar sd_setImageWithURL:[NSURL URLWithString:model.user.avatarUrl]
                           placeholderImage:[UIImage imageNamed:kPlaceholderImageName]];
    }
}

@end
