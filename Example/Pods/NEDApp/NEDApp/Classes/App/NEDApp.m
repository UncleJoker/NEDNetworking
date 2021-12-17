//
//  NEDApp.m
//  000
//
//  Created by 林宁宁 on 2019/9/18.
//  Copyright © 2019 000. All rights reserved.
//

#import "NEDApp.h"

@implementation NEDApp


+(instancetype)shareManager{
    static NEDApp * ss = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        ss = [[NEDApp alloc] init];
    });
    return ss;
}

-(UIWindow *)window{
    return [[[UIApplication sharedApplication] delegate] window];
}

-(NEDDBSetting *)setting{
    if(!_setting){
        _setting = [NEDDBSetting sharedInstance];
    }
    return _setting;
}

-(NEDDBUserInfo *)uinfo{
    if(!_uinfo){
        _uinfo = [NEDDBUserInfo sharedInstance];
    }
    return _uinfo;
}

-(NEDAppInfo *)info{
    if(!_info){
        _info = [[NEDAppInfo alloc] init];
    }
    return _info;
}

@end
