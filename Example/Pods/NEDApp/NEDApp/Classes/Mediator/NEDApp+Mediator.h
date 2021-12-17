//
//  NEDApp+Mediator.h
//  NEDApp
//
//  Created by 98du on 2021/12/10.
//

#import "NEDApp.h"
#import "NEDAppMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface NEDApp (Mediator)

/// 事件回调信息
@property (retain, nonatomic) NEDAppMediator * mediator;

@end

NS_ASSUME_NONNULL_END
