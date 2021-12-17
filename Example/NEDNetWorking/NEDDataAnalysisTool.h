//
//  NEDDataAnalysisTool.h
//  NEDNetWorking_Example
//
//  Created by Joker on 2021/12/17.
//  Copyright © 2021 Joker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEDNetworkBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NEDDataAnalysisTool : NSObject

- (NEDNetworkBaseModel *)dealResponseData:(NSDictionary *)dataDict;

@end

NS_ASSUME_NONNULL_END
