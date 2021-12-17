//
//  NEDEncryptTool.m
//  NEDNetWorking_Example
//
//  Created by Joker on 2021/12/15.
//  Copyright © 2021 Joker. All rights reserved.
//

#import "NEDEncryptTool.h"

@implementation NEDEncryptTool

- (NSString *)encryptParams:(NSMutableDictionary *)params {
    NSLog(@"加密数据%@",params);
    return @"aabbssc";
}

+ (NSString *)encryptMethodStiring {
    return NSStringFromSelector(@selector(encryptParams:));
}

@end
