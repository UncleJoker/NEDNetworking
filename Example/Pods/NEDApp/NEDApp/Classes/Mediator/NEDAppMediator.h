//
//  NEDAppMediator.h
//  NEDApp
//
//  Created by 98du on 2021/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// webview的js操作执行
@protocol NEDAppWebViewJSDelegate <NSObject>
/// 获取APP的信息
- (NSDictionary *)jsWebView_appInfo;
/// 打开新的页面
- (void)jsWebView_openNextWebURL:(NSString *)URL title:(NSString *)title;
/// 上报埋点
- (void)jsWebView_postPointEventID:(NSString *)eventID properties:(NSDictionary *)properties;
/// 跳转到原生页面
- (void)jsWebView_openInnerAppSchemeURL:(NSString *)schemeURL;
- (void)jsWebView_showMessageToast:(NSString *)message;
@end

/// 网络请求
@protocol NEDAppNetworkDelegate <NSObject>

/// 错误信息处理
- (void)network_handleErrorCode:(NSInteger)errorCode message:(NSString *)message;

@end


@interface NEDAppMediator : NSObject

/// webview的js操作执行
@property (retain, nonatomic) id<NEDAppWebViewJSDelegate> delegateJSWebView;

/// 网络请求
@property (retain, nonatomic) id<NEDAppNetworkDelegate> delegateNetwork;

@end

NS_ASSUME_NONNULL_END
