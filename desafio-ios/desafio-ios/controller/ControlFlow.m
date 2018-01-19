//
//  ControlFlow.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "ControlFlow.h"
#import "JavaPopRepositoriesViewController.h"
#import "PullRequestsViewController.h"

@implementation ControlFlow

- (void)perform {
    JavaPopRepositoriesViewController *source = [self sourceViewController];
    PullRequestsViewController *destination = [self destinationViewController];
    destination.repository = source.selectedResository;
    
    [source.navigationController pushViewController:destination animated:YES];
}

@end
