//
//  RestaurantsController.m
//  Mesto
//
//  Created by x on 4/5/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "RestaurantsController.h"

@implementation RestaurantsController


+ (instancetype) sharedInstance
{
    static dispatch_once_t onceToken;
    static RestaurantsController *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

- (void) getRestaurants:(completion)completionBlock
               success:(success)successBlock
               failure:(failure)failureBlock
{
    NSString *URLString = [NSString stringWithFormat:@"restaurant"];
    
    [ServerController requestWithRequestType:PDDRequestTypeGET manager:_manager URLString:URLString parameters:nil completion:completionBlock success:successBlock failure:failureBlock];
    
    
}


+ (void) getRestaurants:(completion)completionBlock
               success:(success)successBlock
               failure:(failure)failureBlock
{
    
    [[self sharedInstance] getRestaurants:completionBlock success:successBlock failure:failureBlock];
    
}

- (void) getRestaurantsWithId:(NSString *)restId
            completion:(completion)completionBlock
                success:(success)successBlock
                failure:(failure)failureBlock
{
    NSString *URLString = [NSString stringWithFormat:@"restaurant/%@", restId];
    
    [ServerController requestWithRequestType:PDDRequestTypeGET manager:_manager URLString:URLString parameters:nil completion:completionBlock success:successBlock failure:failureBlock];
    
    
}


+ (void) getRestaurantsWithId:(NSString *)restId
             completion:(completion)completionBlock
                success:(success)successBlock
                failure:(failure)failureBlock
{
    
    [[self sharedInstance] getRestaurantsWithId:restId
                                     completion:completionBlock
                                        success:successBlock
                                        failure:failureBlock];
}




@end
