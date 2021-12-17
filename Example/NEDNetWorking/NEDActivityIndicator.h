//
//  NEDActivityIndicator.h
//  NEDNetWorking_Example
//
//  Created by Joker on 2021/12/16.
//  Copyright © 2021 Joker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface NEDActivityIndicator : UIView

@property(nonatomic, assign) BOOL hidesWhenStopped;

@property (nonatomic, strong) UIColor *firstColor;

@property (nonatomic, strong) UIColor *secondColor;

@property (nonatomic, strong) UIColor *thirdColor;

- (void)startAnimating;

- (void)stopAnimating;

- (BOOL)isAnimation;

@end

NS_ASSUME_NONNULL_END
