//
//  NEDNetworkBaseModel.h
//  NEDNetWorking
//
//  Created by Joker on 2021/12/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NEDNetworkBaseModel : NSObject

@property(nonatomic, strong) NSError *err;

@property (nonatomic, strong) id data;

@property(nonatomic, assign) NSInteger code;

+ (NEDNetworkBaseModel *)getNetworkFailureResult;

@end

NS_ASSUME_NONNULL_END
