//
//  UIResponder+EventRouter.m
//  DzwEventRouter
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 dzw. All rights reserved.
//

#import "UIResponder+EventRouter.h"
#import "DzwEventRouter.h"
#import <objc/runtime.h>

@implementation UIResponder (EventRouter)
- (instancetype)init {
    if (self = [super init]) {
        [[DzwEventRouter shareInstance].eventInvocationDict addEntriesFromDictionary:[self routeEventMap]];
    }
    return self;
}

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [self.nextResponder routerEventWithName:eventName userInfo:userInfo];
}

- (NSDictionary *)routeEventMap{
    return nil;
}
@end
