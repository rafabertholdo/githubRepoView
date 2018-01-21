//
//  JavaPopRepositoriesViewController.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "JavaPopRepositoriesViewController.h"
#import "RepositoryTableViewCell.h"
#import "PullRequestsViewController.h"
#import "RepositoryList.h"
#import "GithubManager.h"
#import "UITableView+AtivityIndicator.h"

static CGFloat const kTableViewEstimatedHeight = 145.0f;
static NSString *const kAlertTitle = @"Error";
static NSString *const kAlertCancelButtonTitle = @"Ok";

@interface JavaPopRepositoriesViewController ()
@property (nonatomic, strong) NSMutableArray<Repository *> *dataSource;
@property (nonatomic, assign) int lastLoadedPage;
@end


@implementation JavaPopRepositoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastLoadedPage = 0;
    self.tableView.estimatedRowHeight = kTableViewEstimatedHeight;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView startAnimating];
    [self loadNextPage:^{
        [self.tableView stopAnimating];
    }];
}

- (void)loadNextPage:(JavaPopControllerCompletion)completion {
    self.lastLoadedPage++;
    [GithubManager javaPopRepositoryListWithPage:self.lastLoadedPage
                                      completion:^(RepositoryList *repositoryList, NSError *error) {
        if (!error) {
            [self.dataSource addObjectsFromArray:repositoryList.items];
            [self.tableView reloadData];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kAlertTitle
                                                            message:error.localizedDescription
                                                           delegate:nil
                                                  cancelButtonTitle:kAlertCancelButtonTitle
                                                  otherButtonTitles:nil];
            [alert show];
        }
                                          
        if (completion) {
            completion();
        }
    }];
}

-(NSMutableArray<Repository *> *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray<Repository *> new];
    }
    return _dataSource;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RepositoryTableViewCell *cell = (RepositoryTableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RepositoryTableViewCell class])];
    Repository* model = self.dataSource[indexPath.row];
    [cell setupWithModel:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Repository* model = self.dataSource[indexPath.row];
    self.selectedResository = model;
    [self performSegueWithIdentifier:NSStringFromClass([PullRequestsViewController class]) sender:self];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.dataSource.count - 1) {
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        
        [spinner startAnimating];
        spinner.frame = CGRectMake(0, 0, tableView.frame.size.width, 44);
        self.tableView.tableFooterView = spinner;        
        [self loadNextPage:^{
            [spinner stopAnimating];
            self.tableView.tableFooterView = [UIView new];
        }];
    }
}

@end
