//
//  NEDNetworkBaseModel.m
//  NEDNetWorking
//
//  Created by Joker on 2021/12/15.
//

#import "NEDNetworkBaseModel.h"

@implementation NEDNetworkBaseModel

+ (NEDNetworkBaseModel *)getNetworkFailureResult {
    NEDNetworkBaseModel * result = [NEDNetworkBaseModel new];
    result.err = [NSError errorWithDomain:@"网络开小差~" code:404 userInfo:nil];
    result.data = @"网络开小差~";
    result.code = 404;
    return result;
}

@end
