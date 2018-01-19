//
//  PullRequest.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "PullRequest.h"

@implementation PullRequest

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"user": @"user",
             @"title": @"title",
             @"body": @"body",
             @"createdAt": @"created_at",
             @"htmlUrl": @"html_url"
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[User class]];
}

+ (NSValueTransformer *)createdAtJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

@end
