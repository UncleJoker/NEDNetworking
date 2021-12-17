//
//  NEDDeviceInfo.m
//  NEDApp
//
//  Created by 98du on 2021/11/30.
//

#import "NEDDeviceInfo.h"
#import "sys/utsname.h"

@implementation NEDDeviceInfo


+ (BOOL)isIPad{
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

+ (BOOL)isIPhone{
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone);
}

+ (BOOL)isIPhoneX {
    if (@available(iOS 11.0, *)) {
        UIWindow * keyWindow = [UIApplication sharedApplication].delegate.window;
        CGFloat bottomSafeInset = keyWindow.safeAreaInsets.bottom;
        if (bottomSafeInset > 0.0) {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)isPortrait{
    CGFloat winW = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    CGFloat winH = CGRectGetHeight([[UIScreen mainScreen] bounds]);
    return winH > winW;
}



+ (CGFloat)height_bar_status {
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

+ (CGFloat)height_bar_navigation {
    return (self.isIPhoneX ? 88.f : 64.f);
}

+ (CGFloat)height_navigation{
    return self.height_bar_navigation - self.height_bar_status;
}

+ (CGFloat)height_home_indicator {
    return (self.isIPhoneX ? 34.f : 0.f);
}

+ (CGFloat)height_bang {
    return (self.isIPhoneX ? 24 : 0);
}

+ (CGFloat)height_bar_tab {
    return (self.isIPhoneX ? (50+34.f) : 50);
}


+ (CGFloat)s_width{
    return MIN([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
}
+ (CGFloat)s_height{
    return MAX([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
}

+ (CGFloat)accessoryHeight{
    return 44;
}





+ (NSString *)appVersion{
    NSDictionary * infoDict = [[NSBundle mainBundle] infoDictionary];
    return [infoDict objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appBuildVersion{
    NSDictionary * infoDict = [[NSBundle mainBundle] infoDictionary];
    return [infoDict objectForKey:@"CFBundleVersion"];
}

+ (NSString *)appBundleID{
    NSDictionary * infoDict = [[NSBundle mainBundle] infoDictionary];
    return [infoDict objectForKey:@"CFBundleIdentifier"];
}

+ (NSString *)appName{
    NSDictionary * infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString * name = [infoDict objectForKey:@"CFBundleDisplayName"];
    if(!name){
        NSString * displayName = NSLocalizedStringFromTableInBundle(@"CFBundleDisplayName", @"InfoPlist", [NSBundle mainBundle], nil);
        if(![displayName isEqualToString:@"CFBundleDisplayName"]){
            name = displayName;
        }
    }
    if (!name) name = [infoDict valueForKey:@"CFBundleName"];
    if (!name) name = [infoDict valueForKey:@"CFBundleExecutable"];
    return name;
}

+ (NSString *)appBrand{
    return [UIDevice currentDevice].model;
}

+ (NSString *)appOS{
    return [UIDevice currentDevice].systemName;
}

+ (NSString *)appModel{
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding] ?: [UIDevice currentDevice].model;
}

+ (CGFloat)iosVersion{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (NSString *)iosDevicesIDFV{
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
}


@end
