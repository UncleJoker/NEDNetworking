//
//  NEDDeviceInfo.h
//  NEDApp
//
//  Created by 98du on 2021/11/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NEDDeviceInfo : NSObject


/** 是否是iPad*/
@property (assign, nonatomic, readonly, class) BOOL isIPad;
/** 是否是iPhone*/
@property (assign, nonatomic, readonly, class) BOOL isIPhone;
/** 是否是iPhonex*/
@property (assign, nonatomic, readonly, class) BOOL isIPhoneX;
/** 是否是竖屏*/
@property (assign, nonatomic, readonly, class) BOOL isPortrait;

/// MARK: height width

/** 状态栏*/
@property (assign, nonatomic, readonly, class) CGFloat height_bar_status;
/** 导航栏*/
@property (assign, nonatomic, readonly, class) CGFloat height_bar_navigation;
@property (assign, nonatomic, readonly, class) CGFloat height_navigation;
/** tabbar*/
@property (assign, nonatomic, readonly, class) CGFloat height_bar_tab;
/** 安全区*/
@property (assign, nonatomic, readonly, class) CGFloat height_home_indicator;
/** 刘海高*/
@property (assign, nonatomic, readonly, class) CGFloat height_bang;

/** 屏幕宽*/
@property (assign, nonatomic, readonly, class) CGFloat s_width;
/** 屏幕高*/
@property (assign, nonatomic, readonly, class) CGFloat s_height;
/** 键盘的菜单面板高度 默认44*/
@property (assign, nonatomic, readonly, class) CGFloat accessoryHeight;


/// MARK: APP
/** APP版本号*/
@property (copy, nonatomic, readonly, class) NSString * appVersion;
@property (copy, nonatomic, readonly, class) NSString * appBuildVersion;
/** APP bundleid*/
@property (copy, nonatomic, readonly, class) NSString * appBundleID;
/** APP 名字*/
@property (copy, nonatomic, readonly, class) NSString * appName;

/// 品牌
@property (copy, nonatomic, readonly, class) NSString * appBrand;
/// 型号
@property (copy, nonatomic, readonly, class) NSString * appModel;
/// 操作系统
@property (copy, nonatomic, readonly, class) NSString * appOS;

/// iOS系统版本号
@property (assign, nonatomic, readonly, class) CGFloat iosVersion;
/// IDFV
@property (nonatomic, copy, readonly, class) NSString * iosDevicesIDFV;

@end

NS_ASSUME_NONNULL_END
