//
//  NEDUserDBSetting.h
//  NEDKit
//
//  Created by 000 on 2020/12/8.
//  Copyright © 2020 000. All rights reserved.
//

#import <NEDDBUserDefaults/NEDDBUserDefaults.h>

NS_ASSUME_NONNULL_BEGIN

@interface NEDDBSetting : NEDDBUserDefaults


#pragma mark - setting

/// 显示过 引导页 的版本号
@property(nonatomic, copy) NSString * guideLanuch;
@property (nonatomic, assign, readonly) BOOL isGuideShow;


/// 最后登录的手机号
@property (copy, nonatomic) NSString * lastLoginPhone;


#pragma mark - 自定义返回 不用设置 dynamic

/** token刷新间隔 */
@property (assign, nonatomic) NSInteger refreshInterval;


- (void)cleanDefault;


@end

NS_ASSUME_NONNULL_END
