//
//  NEDUserDBSetting.m
//  NEDKit
//
//  Created by 000 on 2020/12/8.
//  Copyright © 2020 000. All rights reserved.
//

#import "NEDDBSetting.h"
#import "NEDApp.h"

@implementation NEDDBSetting

//定义的属性要设置一下 dynamic

@dynamic guideLanuch,lastLoginPhone;



- (void)cleanDefault{
    
 }

- (NSInteger)refreshInterval {
    return 90*60;
}

-(BOOL)isGuideShow{
    if(self.guideLanuch &&
       [self.guideLanuch isEqualToString:APP.info.appVersion]){
        return NO;
    }
    return YES;
}

@end
