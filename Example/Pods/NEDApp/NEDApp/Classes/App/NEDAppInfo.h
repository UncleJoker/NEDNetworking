//
//  NEDAppInfo.h
//  000
//
//  Created by 林宁宁 on 2019/9/20.
//  Copyright © 2019 000. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NEDAppInfo : NSObject

/** 是否是iPad*/
@property (assign, nonatomic, readonly) BOOL isIPad;
/** 是否是iPhone*/
@property (assign, nonatomic, readonly) BOOL isIPhone;
/** 是否是iPhonex*/
@property (assign, nonatomic, readonly) BOOL isIPhoneX;
/** 是否是竖屏*/
@property (assign, nonatomic, readonly) BOOL isPortrait;

/// MARK: height width

/** 状态栏*/
@property (assign, nonatomic, readonly) CGFloat height_bar_status;
/** 导航栏*/
@property (assign, nonatomic, readonly) CGFloat height_bar_navigation;
@property (assign, nonatomic, readonly) CGFloat height_navigation;
/** tabbar*/
@property (assign, nonatomic, readonly) CGFloat height_bar_tab;
/** 安全区*/
@property (assign, nonatomic, readonly) CGFloat height_home_indicator;
/** 刘海高*/
@property (assign, nonatomic, readonly) CGFloat height_bang;

/** 屏幕宽*/
@property (assign, nonatomic, readonly) CGFloat s_width;
/** 屏幕高*/
@property (assign, nonatomic, readonly) CGFloat s_height;
/** 键盘的菜单面板高度 默认44*/
@property (assign, nonatomic, readonly) CGFloat accessoryHeight;


/// MARK: APP
/** APP版本号*/
@property (copy, nonatomic, readonly) NSString * appVersion;
@property (copy, nonatomic, readonly) NSString * appBuildVersion;
/** APP bundleid*/
@property (copy, nonatomic, readonly) NSString * appBundleID;
/** APP 名字*/
@property (copy, nonatomic, readonly) NSString * appName;

/// 品牌
@property (copy, nonatomic, readonly) NSString * appBrand;
/// 型号
@property (copy, nonatomic, readonly) NSString * appModel;
/// 操作系统
@property (copy, nonatomic, readonly) NSString * appOS;

/// iOS系统版本号
@property (assign, nonatomic, readonly) CGFloat iosVersion;
/// IDFV
@property (nonatomic, copy, readonly) NSString * iosDevicesIDFV;



/// MARK: APPStore URL Info
/** APP 商店ID*/
@property (copy, nonatomic) NSString * appStoreID;
/** APP 商店版本监测地址*/
@property (copy, nonatomic, readonly) NSString * appStoreVerionLookUPURL;
/** APP 商店评分地址*/
@property (copy, nonatomic, readonly) NSString * appStoreReviewURL;
/** APP 商店地址*/
@property (copy, nonatomic, readonly) NSString * appStoreURL;

/// MARK: TestFlight
/** testflight地址 */
@property (copy, nonatomic) NSString * appTestFlightURL;
/** 是否是从testflight下载 */
@property (assign, nonatomic, readonly) BOOL isTestFlight;


#pragma mark - 运行过程 临时存储的信息

/** 手机是否有网络*/
@property (assign, nonatomic) BOOL is_with_network;
/** 网络状态 未知：-1  未连接：0  数据流量：1  wifi：2*/
@property (assign, nonatomic) NSInteger netWorkStatesCode;


@end

NS_ASSUME_NONNULL_END
