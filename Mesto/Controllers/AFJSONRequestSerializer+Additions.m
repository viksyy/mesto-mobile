//
//  AFJSONRequestSerializer+Additions.m
//  Mesto
//
//  Created by x on 4/4/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "AFJSONRequestSerializer+Additions.h"

@implementation AFJSONRequestSerializer (Additions)

#pragma mark - Helpers

+ (NSString *)preferredLanguage
{
    return @"en";
//    NSString *preferredLanguage = [NSLocale preferredLanguages].firstObject;
//    if (preferredLanguage != nil) {
//        preferredLanguage = [preferredLanguage componentsSeparatedByString:@"-"].firstObject;
//    } else {
//        preferredLanguage = @"nl";
//    }
//    return preferredLanguage;
}

#pragma mark - Methods

+ (AFJSONRequestSerializer *)pdd_serializer
{
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [serializer setValue:[self preferredLanguage] forHTTPHeaderField:@"Language"];
    [serializer setValue:@"iOS" forHTTPHeaderField:@"Platform"];
    [serializer setValue:[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] forHTTPHeaderField:@"Version"];
    return serializer;
}

@end
