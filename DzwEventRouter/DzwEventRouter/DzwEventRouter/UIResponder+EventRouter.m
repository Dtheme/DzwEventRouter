//
//  UIResponder+EventRouter.m
//  MGJRouterDemo
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 juangua. All rights reserved.
//

#import "UIResponder+EventRouter.h"
#import "DzwEventRouter.h"
#import <objc/runtime.h>

@implementation UIResponder (EventRouter)
- (instancetype)init {
    if (self = [super init]) {
        [[DzwEventRouter shareInstance].eventInvocationDict addEntriesFromDictionary:[self d_RouteEventMap]];
    }
    return self;
}

- (void)d_RouterEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [self.nextResponder d_RouterEventWithName:eventName userInfo:userInfo];
}

- (NSDictionary *)d_RouteEventMap{
    return nil;
}
@end
