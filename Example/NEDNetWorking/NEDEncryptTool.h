//
//  NEDEncryptTool.h
//  NEDNetWorking_Example
//
//  Created by Joker on 2021/12/15.
//  Copyright © 2021 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEDNetworkHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface NEDEncryptTool : NSObject

- (NSString *)encryptParams:(NSMutableDictionary *)params;

+ (NSString *)encryptMethodStiring;

@end

NS_ASSUME_NONNULL_END
