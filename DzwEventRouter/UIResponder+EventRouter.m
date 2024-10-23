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
        [[DzwEventRouter shareInstance].eventInvocationDict addEntriesFromDictionary:[self ZG_RouteEventMap]];
    }
    return self;
}

- (void)ZG_RouterEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [self.nextResponder ZG_RouterEventWithName:eventName userInfo:userInfo];
}

- (NSDictionary *)ZG_RouteEventMap{
    return nil;
}
@end
