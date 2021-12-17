//
//  NEDNetworkTool.h
//  AFNetworking
//
//  Created by Joker on 2021/12/15.
//

#import <Foundation/Foundation.h>
#import "NEDNetworkConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface NEDNetworkTool : NSObject

/// 网络请求参数需要加密调用 加密的工具和方法外部提供
/// @param config 网络请求配置项
/// @param params 需要加密的请求参数
+ (id)encryptParamsWithConfig:(NEDNetworkConfig *)config params:(NSMutableDictionary *)params;

/// 网络请求Header加密
/// @param header Header数据
+ (id)encryptHttpRequestHeader:(NSMutableDictionary *)header;

/// HEXColor
/// @param hexString hex值
+ (UIColor *) colorFromHexString:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
