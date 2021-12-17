//
//  NEDNetworkTool.m
//  AFNetworking
//
//  Created by Joker on 2021/12/15.
//

#import "NEDNetworkTool.h"

@implementation NEDNetworkTool

+ (id)encryptParamsWithConfig:(NEDNetworkConfig *)config params:(NSMutableDictionary *)params {
    
    if (config.encryptParamsMethod || config.encryptParamsClass) {
        Class EncryptParamsTool = NSClassFromString(config.encryptParamsClass);
        SEL encryptParamsSelector = NSSelectorFromString(config.encryptParamsMethod);
        if (!EncryptParamsTool || !encryptParamsSelector) {
            NSAssert((EncryptParamsTool && encryptParamsSelector), @"加密工具类不存在或者方法不存在,如果不需要加密请移除NEDNetworkConfig中的encryptParamsClass和encryptParamsMethod");
            return params;
        }
        id encryptTool = [EncryptParamsTool new];
        id encryptObject;
        if ([encryptTool respondsToSelector:encryptParamsSelector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            switch ([NEDNetworkTool getNumberParamsWith:config.encryptParamsMethod]) {
                case 0:
                    encryptObject = [encryptTool performSelector:encryptParamsSelector];
                    break;
                case 1:
                    encryptObject = [encryptTool performSelector:encryptParamsSelector withObject:params];
                    break;
                default:
                    break;
            }
#pragma clang diagnostic pop   
        }
        return @{config.encryptParamsKeyStr: encryptObject};
    }
    return params;
}

+ (id)encryptHttpRequestHeader:(NSMutableDictionary *)header {
    
    
    return header;
}

+ (UIColor *) colorFromHexString:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
{
        if([cleanString length] == 3)
        {
            cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                           [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                           [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                           [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
        }
    }
    if([cleanString length] == 6)
    {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

#pragma mark - 🚗 Private

+ (NSInteger)getNumberParamsWith:(NSString *)selectorStr {
    return [selectorStr componentsSeparatedByString:@":"].count - 1;
}

@end
