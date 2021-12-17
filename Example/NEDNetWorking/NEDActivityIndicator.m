//
//  NEDActivityIndicator.m
//  NEDNetWorking_Example
//
//  Created by Joker on 2021/12/16.
//  Copyright © 2021 Joker. All rights reserved.
//

#import "NEDActivityIndicator.h"

#define ANIMATION_DURATION_SECS 0.5

typedef enum : NSUInteger {
    NEDActivityIndicatorStepZero  = 0,
    NEDActivityIndicatorStepOne   = 1,
    NEDActivityIndicatorStepTwo   = 2,
    NEDActivityIndicatorStepThree = 3,
    NEDActivityIndicatorStepFour  = 4,
} NEDActivityIndicatorStep;

@interface NEDActivityIndicator ()

@property(nonatomic, assign) CGFloat dotRadius;
@property(nonatomic, assign) NEDActivityIndicatorStep stepNumber;
@property(nonatomic, assign) BOOL isAnimating;
@property(nonatomic, assign) CGRect firstPoint, secondPoint, thirdPoint, fourthPoint;
@property (nonatomic, strong) CALayer *firstDot, *secondDot, *thirdDot;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation NEDActivityIndicator

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupViewLayout:self.frame];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setupViewLayout:frame];
    }
    return self;
}

- (void)setupViewLayout:(CGRect)frame {
    _stepNumber = NEDActivityIndicatorStepZero;
    _isAnimating = NO;
    _hidesWhenStopped = YES;
    _firstColor = [UIColor colorWithRed:232.0/255.0f green:35.0/255.0f blue:111.0/255.0f alpha:1.0];
    _secondColor = [UIColor colorWithRed:111.0/255.0f green:35.0/255.0f blue:232.0/255.0f alpha:1.0];
    _thirdColor = [UIColor colorWithRed:232.0/255.0f green:111.0/255.0f blue:35.0/255.0f alpha:1.0];
    
    _dotRadius = frame.size.height <= frame.size.width ? frame.size.width/12 : frame.size.height/12;
    _firstPoint = CGRectMake(frame.size.width/4-_dotRadius, frame.size.height/2-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    _secondPoint = CGRectMake(frame.size.width/2-_dotRadius, frame.size.height/4-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    _thirdPoint = CGRectMake(3*frame.size.width/4-_dotRadius, frame.size.height/2-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    _fourthPoint = CGRectMake(frame.size.width/2-_dotRadius, 3*frame.size.height/4-_dotRadius, 2*_dotRadius, 2*_dotRadius);
    
    _firstDot = [CALayer layer];
    [_firstDot setMasksToBounds:YES];
    [_firstDot setBackgroundColor:[self.firstColor CGColor]];
    [_firstDot setCornerRadius:_dotRadius];
    [_firstDot setBounds:CGRectMake(0.0f, 0.0f, _dotRadius*2, _dotRadius*2)];
    _firstDot.frame = _fourthPoint;
    
    _secondDot = [CALayer layer];
    [_secondDot setMasksToBounds:YES];
    [_secondDot setBackgroundColor:[self.secondColor CGColor]];
    [_secondDot setCornerRadius:_dotRadius];
    [_secondDot setBounds:CGRectMake(0.0f, 0.0f, _dotRadius*2, _dotRadius*2)];
    _secondDot.frame = _firstPoint;
    
    _thirdDot = [CALayer layer];
    [_thirdDot setMasksToBounds:YES];
    [_thirdDot setBackgroundColor:[self.thirdColor CGColor]];
    [_thirdDot setCornerRadius:_dotRadius];
    [_thirdDot setBounds:CGRectMake(0.0f, 0.0f, _dotRadius*2, _dotRadius*2)];
    _thirdDot.frame = _thirdPoint;
    
    [[self layer] addSublayer:_firstDot];
    [[self layer] addSublayer:_secondDot];
    [[self layer] addSublayer:_thirdDot];
    
    self.layer.hidden = YES;
}

- (void)startAnimating {
    if (!_isAnimating) {
        _isAnimating = YES;
        
        self.layer.hidden = NO;
        
       _timer = [NSTimer scheduledTimerWithTimeInterval:ANIMATION_DURATION_SECS target:self selector:@selector(animateNextStep) userInfo:nil repeats:YES];
    }
}

- (void)stopAnimating {
    _isAnimating = NO;
    
    if (self.hidesWhenStopped) {
        self.layer.hidden = YES;
    }
    
    [_timer invalidate];
    
    _stepNumber = NEDActivityIndicatorStepZero;
    _firstDot.frame = _fourthPoint;
    _secondDot.frame = _firstPoint;
    _thirdDot.frame = _thirdPoint;
}

- (void)animateNextStep {
    switch (_stepNumber)
    {
        case NEDActivityIndicatorStepZero:
        {
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            _firstDot.frame = _secondPoint;
            _thirdDot.frame = _fourthPoint;
            [CATransaction commit];
            break;
        }
        case NEDActivityIndicatorStepOne:
        {
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            _secondDot.frame = _thirdPoint;
            _thirdDot.frame = _firstPoint;
            [CATransaction commit];
            break;
        }
        case NEDActivityIndicatorStepTwo:
        {
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            _firstDot.frame = _fourthPoint;
            _thirdDot.frame = _secondPoint;
            [CATransaction commit];
            break;
        }
        case NEDActivityIndicatorStepThree:
        {
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            _secondDot.frame = _firstPoint;
            _thirdDot.frame = _thirdPoint;
            [CATransaction commit];
            break;
        }
        case NEDActivityIndicatorStepFour:
        {
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            _firstDot.frame = _secondPoint;
            _thirdDot.frame = _fourthPoint;
            [CATransaction commit];
            _stepNumber = NEDActivityIndicatorStepZero;
        }
        default:
            break;
    }
    _stepNumber++;
}

- (BOOL)isAnimating {
    return _isAnimating;
}

- (void)setFirstColor:(UIColor *)firstColor {
    _firstColor = firstColor;
    [_firstDot setBackgroundColor:[self.firstColor CGColor]];
}

- (void)setSecondColor:(UIColor *)secondColor {
    _secondColor = secondColor;
    [_secondDot setBackgroundColor:[self.secondColor CGColor]];
}

- (void)setThirdColor:(UIColor *)thirdColor {
    _thirdColor = thirdColor;
    [_thirdDot setBackgroundColor:[self.thirdColor CGColor]];
}

@end
