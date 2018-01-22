//
//  UITableView+AtivityIndicator.h
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 21/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface UITableView (AtivityIndicator)

/**
 * Insere um Activity Indicator na tableview
 */
- (void)startAnimating;

/**
 * Para a animação e esconde o Activity Indicator
 */
- (void)stopAnimating;

@end
