//
//  NEDNetWorking.m
//  NEDNetWorking_Example
//
//  Created by apple on 2021/12/14.
//  Copyright © 2021 Joker. All rights reserved.
//

#import "NEDNetworking.h"
#import "AFNetworking.h"
#import "NEDNetworkTool.h"
#import "NEDNetworkProtocol.h"
#import "YYKit.h"

@interface NEDNetworking ()<NEDNetworkDelegate>

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation NEDNetworking

+ (instancetype)shareNetWorking {
    static NEDNetworking *_sharedNetworking = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedNetworking = [[self alloc] init];
    });
    return _sharedNetworking;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
        });
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}

- (void)setNetworkConfig:(void (^)(__kindof NEDNetworkConfig * config))configBlock {
    self.config = [NEDNetworkConfig new];
    configBlock(self.config);
}

- (void)requestUrl:(NSString *)url httpMethod:(NEDRequestMethodType)httpMethod params:(NSMutableDictionary *)params compelete:(void (^)(NEDNetworkBaseModel *model))compelete {
    
    id paramsObject = [NEDNetworkTool encryptParamsWithConfig:self.config params:params];

    NSMutableURLRequest *request = [self getURLRequestWithParamsObject:paramsObject httpMethod:httpMethod url:[self.config.baseUrl stringByAppendingString:url]];
    
    NSURLSessionDataTask *dataTask = [self.sessionManager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            NEDNetworkBaseModel *resultModel = [NEDNetworkBaseModel getNetworkFailureResult];
            compelete(resultModel);
            return;
        }
        
        NEDNetworkBaseModel *resultModel = [NEDNetworkBaseModel new];
        resultModel.data = responseObject;
        compelete(resultModel);
        
    }];
    
    [dataTask resume];
}

#pragma mark - 🚗 Private

- (NSMutableURLRequest *)getURLRequestWithParamsObject:(NSMutableDictionary *)paramsObject
                                            httpMethod:(NEDRequestMethodType)httpMethod
                                                   url:(NSString *)url {
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [[self getRequestSerializer]requestWithMethod:[self getHttpMethod:httpMethod] URLString:url parameters:paramsObject error:&serializationError];
    if (serializationError) {
        NSLog(@"解析错误");
        return nil;
    }
    
    request.timeoutInterval = self.config.timeoutInterval;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.config.headerDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [request addValue:obj forHTTPHeaderField:key];
    }];
    
    return request;
}

- (AFJSONRequestSerializer *)getRequestSerializer
{
    static dispatch_once_t onceToken;
    static AFJSONRequestSerializer *_request = nil;
    dispatch_once(&onceToken, ^{
        _request = [AFJSONRequestSerializer serializer];
    });
    return _request;
}

- (NSString *)getHttpMethod:(NEDRequestMethodType)httpMethod {
    
    NSString *httpMethodStr;
    
    switch (httpMethod) {
        case NEDRequestMethodGET:
            httpMethodStr = @"GET";
            break;
        case NEDRequestMethodPOST:
            httpMethodStr = @"POST";
            break;
        case NEDRequestMethodHEAD:
            httpMethodStr = @"HEAD";
            break;
        case NEDRequestMethodPUT:
            httpMethodStr = @"PUT";
            break;
        case NEDRequestMethodDELETE:
            httpMethodStr = @"DELETE";
            break;
        case NEDRequestMethodPATCH:
            httpMethodStr = @"PATCH";
            break;
        default:
            httpMethodStr = @"GET";
            break;
    }
    return httpMethodStr;
}

@end
