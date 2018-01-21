//
//  PullRequest.m
//  desafio-ios
//
//  Created by Rafael Guilherme Bertholdo on 19/01/18.
//  Copyright © 2018 Rafael Guilherme Bertholdo. All rights reserved.
//

#import "PullRequest.h"
#import "TypeDefs.h"

static NSString *const kServiceDateFormatter = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
static NSString *const kServiceDateLocale = @"en_US_POSIX";
static NSString *const kServiceCreatedAt = @"created_at";
static NSString *const kServiceHtmlUrl = @"html_url";

@implementation PullRequest

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:kServiceDateLocale];
    dateFormatter.dateFormat = kServiceDateFormatter;
    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             STR_PROP(user): STR_PROP(user),
             STR_PROP(title): STR_PROP(title),
             STR_PROP(body): STR_PROP(body),
             STR_PROP(createdAt): kServiceCreatedAt,
             STR_PROP(htmlUrl): kServiceHtmlUrl
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
