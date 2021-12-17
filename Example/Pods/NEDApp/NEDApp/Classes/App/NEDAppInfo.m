//
//  NEDAppInfo.m
//  000
//
//  Created by 林宁宁 on 2019/9/20.
//  Copyright © 2019 000. All rights reserved.
//

#import "NEDAppInfo.h"
#import "NEDDeviceInfo.h"

@implementation NEDAppInfo

- (BOOL)isIPad{
    return [NEDDeviceInfo isIPad];
}

-(BOOL)isIPhone{
    return [NEDDeviceInfo isIPhone];
}

- (BOOL)isIPhoneX {
    return [NEDDeviceInfo isIPhoneX];
}

-(BOOL)isPortrait{
    return [NEDDeviceInfo isPortrait];
}


- (CGFloat)height_bar_status {
    return [NEDDeviceInfo height_bar_status];
}

- (CGFloat)height_bar_navigation {
    return [NEDDeviceInfo height_bar_navigation];
}

-(CGFloat)height_navigation{
    return [NEDDeviceInfo height_navigation];
}

- (CGFloat)height_home_indicator {
    return [NEDDeviceInfo height_home_indicator];
}

- (CGFloat)height_bang {
    return [NEDDeviceInfo height_bang];
}

- (CGFloat)height_bar_tab {
    return [NEDDeviceInfo height_bar_tab];
}


-(CGFloat)s_width{
    return [NEDDeviceInfo s_width];
}
-(CGFloat)s_height{
    return [NEDDeviceInfo s_height];
}

-(CGFloat)accessoryHeight{
    return [NEDDeviceInfo accessoryHeight];
}





-(NSString *)appVersion{
    return [NEDDeviceInfo appVersion];
}

- (NSString *)appBuildVersion{
    return [NEDDeviceInfo appBuildVersion];
}

-(NSString *)appBundleID{
    return [NEDDeviceInfo appBundleID];
}

-(NSString *)appName{
    return [NEDDeviceInfo appName];
}

-(NSString *)appBrand{
    return [NEDDeviceInfo appBrand];
}

-(NSString *)appOS{
    return [NEDDeviceInfo appOS];
}

-(NSString *)appModel{
    return [NEDDeviceInfo appModel];
}

- (CGFloat)iosVersion{
    return [NEDDeviceInfo iosVersion];
}

-(NSString *)iosDevicesIDFV{
    return [NEDDeviceInfo iosDevicesIDFV];
}

/** 是否从testflight安装 */
- (BOOL)isTestFlight {
    BOOL isAppStoreReceiptSandbox = [[[[NSBundle mainBundle] appStoreReceiptURL] lastPathComponent] isEqualToString:@"sandboxReceipt"];
    BOOL hasEmbeddedMobileProvision = [[NSBundle mainBundle] pathForResource:@"embedded" ofType:@"mobileprovision"] != nil;
    return isAppStoreReceiptSandbox && !hasEmbeddedMobileProvision;
}


- (NSString *)appStoreReviewURL{
    return [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?action=write-review",self.appStoreID];
}

- (NSString *)appStoreVerionLookUPURL{
    return [NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@",self.appStoreID];
}

-(NSString *)appStoreURL{
    return [NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?l=zh&ls=1&mt=8",self.appStoreID];
}

@end
