//
//  ServiceController.m
//  Mesto
//
//  Created by x on 4/4/19.
//  Copyright © 2019 x. All rights reserved.
//

#import "ServerController.h"
//#import "../../Mesto/Screen/General/NavigationController.h"

NSString *const PDDBaseURLString = @"https://mesto.mk/wp-json/wp/";
//NSString *const PDDBaseURLString = @"https://backend.peddy.nl/";
static NSString *const PDDAPIVersionNumber = @"v2";

static NSInteger const PDDUnauthorizedErrorStatusCode = 401;
static NSInteger const PDDPaymentRequiredErrorStatusCode = 402;

@interface ServerController()
@property (copy, nonatomic) NSArray *requestTypes;
@property (strong, nonatomic) NSMutableArray *retryingURLStrings;
@end

@implementation ServerController
{
//    UIAlertController *_paymentRequiredAlertController;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.requestTypes = @[@"GET", @"POST", @"PUT", @"DELETE"];
        self.retryingURLStrings = [NSMutableArray new];
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static ServerController *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

- (void)performSelector:(SEL)selector
            withManager:(AFHTTPRequestOperationManager *)manager
              URLString:(NSString *)URLString
             parameters:(id)parameters
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                success:(success)successBlock
                failure:(failure)failureBlock
{
    URLString =
    [URLString stringByAddingPercentEncodingWithAllowedCharacters:
     [NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSLog(@"%@ (parameters: %@)", URLString, parameters);
    
    NSMethodSignature *signature = [manager methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setTarget:manager];
    [invocation setSelector:selector];
    
    // Indices 0 and 1 indicate the hidden arguments self and _cmd, respectively;
    // you should set these values directly with the target and selector properties.
    // Use indices 2 and greater for the arguments normally passed in a message.
    
    [invocation setArgument:&(URLString) atIndex:2];
    [invocation setArgument:&(parameters) atIndex:3];
    
    if (block != nil) {
        [invocation setArgument:&(block) atIndex:4];
        [invocation setArgument:&(successBlock) atIndex:5];
    }
    else {
        [invocation setArgument:&(successBlock) atIndex:4];
    }
    
    // Failure.
    
    failure failureBlockHook = ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSInteger errorStatusCode = operation.response.statusCode;
        if (errorStatusCode == PDDUnauthorizedErrorStatusCode) {
            NSLog(@"Log out?");
            
            if (failureBlock != nil) {
                failureBlock(operation, error);
            }
        }
        else if (![self.retryingURLStrings containsObject:URLString]) {
            [self.retryingURLStrings addObject:URLString];
            
            success successBlockHook = ^(AFHTTPRequestOperation *operation, id responseObject) {
                [self.retryingURLStrings removeObject:URLString];
                
                if (successBlock != nil) {
                    successBlock(operation, responseObject);
                }
            };
            
            failure failureBlockHook = ^(AFHTTPRequestOperation *operation, NSError *error) {
                [self.retryingURLStrings removeObject:URLString];
                
                if (failureBlock != nil) {
                    failureBlock(operation, error);
                }
            };
            
            [self performSelector:selector
                      withManager:manager
                        URLString:URLString
                       parameters:parameters
        constructingBodyWithBlock:block
                          success:successBlockHook
                          failure:failureBlockHook];
        }
        else if (failureBlock != nil) {
            failureBlock(operation, error);
        }
    };
    
    if (block != nil) {
        [invocation setArgument:&(failureBlockHook) atIndex:6];
    }
    else {
        [invocation setArgument:&(failureBlockHook) atIndex:5];
    }
    
    //
    
    [invocation invoke];
}


- (void)requestWithRequestType:(PDDRequestType)requestType
                       manager:(AFHTTPRequestOperationManager *)manager
                     URLString:(NSString *)URLString
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                    completion:(completion)completionBlock
                       success:(success)successBlock
                       failure:(failure)failureBlock
{
    NSMutableString *selectorAsString =
    [NSMutableString stringWithFormat:@"%@:parameters:",
     self.requestTypes[requestType]];
    
    if (block != nil) {
        [selectorAsString appendString:@"constructingBodyWithBlock:"];
    }
    
    [selectorAsString appendString:@"success:failure:"];
    
    SEL selector = NSSelectorFromString(selectorAsString);
    
    URLString = [NSString stringWithFormat:@"%@/%@",
                 PDDAPIVersionNumber,
                 URLString];
    
    success successBlockHook = ^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completionBlock != nil) {
            completionBlock();
        }
        
        if (successBlock != nil) {
            successBlock(operation, responseObject);
        }
    };
    
    failure failureBlockkHook = ^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completionBlock != nil) {
            completionBlock();
        }
        
        if (failureBlock != nil) {
            failureBlock(operation, error);
        }
    };
    
    [self performSelector:selector
              withManager:manager
                URLString:URLString
               parameters:parameters
constructingBodyWithBlock:block
                  success:successBlockHook
                  failure:failureBlockkHook];
}




+ (void)requestWithRequestType:(PDDRequestType)requestType
                       manager:(AFHTTPRequestOperationManager *)manager
                     URLString:(NSString *)URLString
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block
                    completion:(completion)completionBlock
                       success:(success)successBlock
                       failure:(failure)failureBlock
{
    [[self sharedInstance] requestWithRequestType:requestType
                                          manager:manager
                                        URLString:URLString
                                       parameters:parameters
                        constructingBodyWithBlock:block
                                       completion:completionBlock
                                          success:successBlock
                                          failure:failureBlock];
}

+ (void)requestWithRequestType:(PDDRequestType)requestType
                       manager:(AFHTTPRequestOperationManager *)manager
                     URLString:(NSString *)URLString
                    parameters:(id)parameters
                    completion:(completion)completionBlock
                       success:(success)successBlock
                       failure:(failure)failureBlock
{
    [self requestWithRequestType:requestType
                         manager:manager
                       URLString:URLString
                      parameters:parameters
       constructingBodyWithBlock:nil
                      completion:completionBlock
                         success:successBlock
                         failure:failureBlock];
}


@end
