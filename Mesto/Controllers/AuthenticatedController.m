//
//  AuthenticatedController.m
//  Mesto
//
//  Created by x on 4/5/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "AuthenticatedController.h"

//#import "AuthenticationController.h"
//#import "NotificationController.h"

#import "AFJSONRequestSerializer+Additions.h"

@interface AuthenticatedController ()
@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@end

@implementation AuthenticatedController

#pragma mark - Instance methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURL *baseURL = [NSURL URLWithString:PDDBaseURLString];
        self.manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
        _manager.requestSerializer = [AFJSONRequestSerializer pdd_serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        _manager.securityPolicy.allowInvalidCertificates = YES;
        _manager.securityPolicy.validatesDomainName = NO;
        
//        if ([AuthenticationController isAuthenticated]) {
//            [AuthenticationController authenticateManager:_manager];
//        }
//
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didLogin) name:PDDDidLoginNotification object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didLogout) name:PDDDidLogoutNotification object:nil];
    }
    return self;
}

#pragma mark - Lifecycle

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Observers

- (void)didLogin
{
//    [AuthenticationController authenticateManager:_manager];
}

- (void)didLogout
{
//    [AuthenticationController unauthenticateManager:_manager];
}

@end
