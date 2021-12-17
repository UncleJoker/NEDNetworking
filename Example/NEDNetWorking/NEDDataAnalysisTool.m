//
//  NEDDataAnalysisTool.m
//  NEDNetWorking_Example
//
//  Created by Joker on 2021/12/17.
//  Copyright © 2021 Joker. All rights reserved.
//

#import "NEDDataAnalysisTool.h"
#import "YYKit.h"

@implementation NEDDataAnalysisTool

- (NEDNetworkBaseModel *)dealResponseData:(NSDictionary *)dataDict {
    
    NEDNetworkBaseModel *baseModel = [NEDNetworkBaseModel modelWithDictionary:dataDict];
    
    return baseModel;
}

@end
