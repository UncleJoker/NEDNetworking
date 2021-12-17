//
//  NEDNetworkConfig.h
//  NEDNetWorking
//
//  Created by apple on 2021/12/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NEDNetworkConfig : NSObject

/// 请求超时时间
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/// 请求域名
@property(nonatomic, copy) NSString *baseUrl;

/// 是否显示加载数据HUD 默认关闭
@property(nonatomic, assign) BOOL isShowLoadingHUD;

/// 请求成功code值 默认是 0
@property(nonatomic, assign) NSInteger successCode;

/// 参数加密方法 自定义的加密类 (确保自定义加密工具类存在)
@property (nonatomic, copy) NSString *encryptParamsClass;

/// 参数加密方法(传入参数,返回加密后的字符串)例如: - (NSString *)encryptParams:(NSMutableDictionary *)params
/// 对参数加密必须方法带一个字典
@property (nonatomic, copy) NSString *encryptParamsMethod;

/// 加密之后存放的key
@property(nonatomic, copy) NSString *encryptParamsKeyStr;

/// 设置Header加密之后的数据
@property (nonatomic, strong) NSMutableDictionary *headerDict;

@end

NS_ASSUME_NONNULL_END
