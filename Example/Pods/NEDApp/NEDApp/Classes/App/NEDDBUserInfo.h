//
//  NEDUserDefaultsUserInfo.h
//  000
//
//  Created by 林宁宁 on 2019/9/20.
//  Copyright © 2019 000. All rights reserved.
//

#import <NEDDBUserDefaults/NEDDBUserDefaults.h>

NS_ASSUME_NONNULL_BEGIN

/** app的用户信息*/
@interface NEDDBUserInfo : NEDDBUserDefaults

/** 清空存储信息*/
- (void)cleanUserInfo;

@end

NS_ASSUME_NONNULL_END
