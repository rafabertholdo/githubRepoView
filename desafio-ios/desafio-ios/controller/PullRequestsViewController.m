//
//  PullRequestsViewController.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "PullRequestsViewController.h"
#import "PullRequestTableViewCell.h"
#import "PullRequest.h"
#import "GithubManager.h"
#import "UITableView+AtivityIndicator.h"

static CGFloat const kTableViewEstimatedHeight = 135.0f;
static NSString *const kAlertTitle = @"Error";
static NSString *const kAlertCancelButtonTitle = @"Ok";
static NSString *const kEmptyStateMessage = @"No pull requests for this repository";
static NSString *const kEmptyStateFontName = @"Apple SD Gothic Neo";
static CGFloat const kEmptyStateFontSize = 15;

@interface PullRequestsViewController ()
@property (nonatomic,strong) NSArray<PullRequest *> *dataSource;
@end

@implementation PullRequestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = kTableViewEstimatedHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    self.navigationItem.title = self.repository.name;
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView startAnimating];
    [GithubManager pullRequequestsOfRepository:self.repository
                                    completion:^(NSArray<PullRequest *> *pullRequests, NSError *error) {
        if (!error) {
            self.dataSource = pullRequests;
            [self.tableView reloadData];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kAlertTitle
                                                            message:error.localizedDescription
                                                           delegate:nil
                                                  cancelButtonTitle:kAlertCancelButtonTitle
                                                  otherButtonTitles:nil];
            [alert show];
        }
        [self.tableView stopAnimating];
    }];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (!self.dataSource) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return 0;
    }

    NSInteger numOfSections = 0;
    if (self.dataSource.count) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        numOfSections = 1;
        self.tableView.backgroundView = nil;
    } else {
        UILabel *emptyStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
        emptyStateLabel.text = kEmptyStateMessage;
        emptyStateLabel.textColor = [UIColor blackColor];
        emptyStateLabel.textAlignment = NSTextAlignmentCenter;
        emptyStateLabel.font = [UIFont fontWithName:kEmptyStateFontName size:kEmptyStateFontSize];
        self.tableView.backgroundView = emptyStateLabel;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return numOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PullRequestTableViewCell *cell = (PullRequestTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PullRequestTableViewCell class]) forIndexPath:indexPath];
    
    PullRequest *model = self.dataSource[indexPath.row];
    [cell setupWithModel:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PullRequest *model = self.dataSource[indexPath.row];
    NSURL *url = [NSURL URLWithString:model.htmlUrl];
    
    if (@available(iOS 10, *)) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:NULL];
    } else {
        [[UIApplication sharedApplication] openURL:url];
    }
}


@end
