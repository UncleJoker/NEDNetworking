//
//  NEDApp+Mediator.m
//  NEDApp
//
//  Created by 98du on 2021/12/10.
//

#import "NEDApp+Mediator.h"
#import <objc/runtime.h>

@implementation NEDApp (Mediator)

@dynamic mediator;

-(NEDAppMediator *)mediator{
    NEDAppMediator * m = objc_getAssociatedObject(self, @selector(mediator));
    if(!m){
        m = [[NEDAppMediator alloc] init];
        objc_setAssociatedObject(self, @selector(mediator), m, OBJC_ASSOCIATION_RETAIN);
    }
    return m;
}

@end
