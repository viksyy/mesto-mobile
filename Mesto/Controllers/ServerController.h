#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

extern NSString *const PDDBaseURLString;

typedef NS_ENUM(NSInteger, PDDRequestType) {
    PDDRequestTypeGET = 0,
    PDDRequestTypePOST,
    PDDRequestTypePUT,
    PDDRequestTypeDELETE
};

typedef void (^completion)(void);
typedef void (^success)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^failure)(AFHTTPRequestOperation *operation, NSError *error);

@interface ServerController : NSObject

+ (void)requestWithRequestType:(PDDRequestType)requestType
                       manager:(AFHTTPRequestOperationManager *)manager
                     URLString:(NSString *)URLString
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                    completion:(completion)completionBlock
                       success:(success)successBlock
                       failure:(failure)failureBlock;

+ (void)requestWithRequestType:(PDDRequestType)requestType
                       manager:(AFHTTPRequestOperationManager *)manager
                     URLString:(NSString *)URLString
                    parameters:(id)parameters
                    completion:(completion)completionBlock
                       success:(success)successBlock
                       failure:(failure)failureBlock;

@end
