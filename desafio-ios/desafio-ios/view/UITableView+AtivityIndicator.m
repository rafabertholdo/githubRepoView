//
//  UITableView+AtivityIndicator.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 21/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "UITableView+AtivityIndicator.h"
#import  <objc/runtime.h>

@interface UITableView (AtivityIndicator)
@property (nonatomic, strong) id associatedObject;
@end


@implementation UITableView (AtivityIndicator)

- (void)setAssociatedObject:(id)object {
    objc_setAssociatedObject(self, @selector(associatedObject), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedObject {
    return objc_getAssociatedObject(self, @selector(associatedObject));
}

- (void)startAnimating {
    UIActivityIndicatorView *activityIndicator = nil;
    
    if (!self.associatedObject) {
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.associatedObject = activityIndicator;
        activityIndicator.hidesWhenStopped = YES;
        self.backgroundView = activityIndicator;
    } else {
        activityIndicator = (UIActivityIndicatorView *)self.associatedObject;
    }
    [activityIndicator startAnimating];
}

- (void)stopAnimating {
    UIActivityIndicatorView *activityIndicator = (UIActivityIndicatorView *)self.associatedObject;
    [activityIndicator stopAnimating];
}

@end
