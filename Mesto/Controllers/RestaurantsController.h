//
//  RestaurantsController.h
//  Mesto
//
//  Created by x on 4/5/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "AuthenticatedController.h"

@interface RestaurantsController : AuthenticatedController
+ (void)getRestaurants:(completion)completionBlock
                    success:(success)successBlock
                    failure:(failure)failureBlock;

+ (void) getRestaurantsWithId:(NSString *)restId
                   completion:(completion)completionBlock
                      success:(success)successBlock
                      failure:(failure)failureBlock;
@end
