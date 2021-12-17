//
//  NEDApp.h
//  000
//
//  Created by 林宁宁 on 2019/9/18.
//  Copyright © 2019 000. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NEDAppInfo.h"
#import "NEDDBUserInfo.h"
#import "NEDDBSetting.h"
#import "NEDAppInfo.h"

NS_ASSUME_NONNULL_BEGIN

#define APP     [NEDApp shareManager]

@interface NEDApp : NSObject

+(instancetype)shareManager;

@property (weak, nonatomic, readonly) UIWindow * window;
/// app信息 机型等
@property (retain, nonatomic) NEDAppInfo * info;
/// app 设置信息 存在DataBase中
@property (retain, nonatomic) NEDDBSetting * setting;
/// 用户信息
@property (retain, nonatomic) NEDDBUserInfo * uinfo;

@end

NS_ASSUME_NONNULL_END
