//
//  PullRequestsViewController.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

@import UIKit;
#import "Repository.h"

@interface PullRequestsViewController : UITableViewController

@property (nonatomic, weak) Repository *repository;

@end
