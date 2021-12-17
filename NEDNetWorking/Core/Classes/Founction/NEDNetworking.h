//
//  NEDNetWorking.h
//  NEDNetWorking_Example
//
//  Created by apple on 2021/12/14.
//  Copyright © 2021 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEDNetworkDefine.h"
#import "NEDNetworkBaseModel.h"

@class AFHTTPSessionManager, NEDNetworking, NEDNetworkConfig;

NS_ASSUME_NONNULL_BEGIN

@interface NEDNetworking : NSObject

/// AFHTTPSessionManager 对象
@property (nonatomic, strong, readonly) AFHTTPSessionManager *sessionManager;

@property (nonatomic, strong) NEDNetworkConfig *config;

+ (instancetype)shareNetWorking;

- (void)setNetworkConfig:(void (^)(__kindof NEDNetworkConfig * config))configBlock;

- (void)requestUrl:(NSString *)url
        httpMethod:(NEDRequestMethodType)httpMethod
            params:(NSMutableDictionary *)params
         compelete:(void (^)(NEDNetworkBaseModel *model))compelete;

- (void)uploadWithUrl:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
