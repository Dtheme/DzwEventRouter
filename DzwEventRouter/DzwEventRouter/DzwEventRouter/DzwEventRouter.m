//
//  DzwEventRouter.m
//  DzwEventRouter
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 dzw. All rights reserved.
//

#import "DzwEventRouter.h"

@interface DzwEventRouter ()
@property (nonatomic, weak) UIViewController *delegate;
@end

@implementation DzwEventRouter

+ (instancetype)shareInstance {
    static DzwEventRouter *router;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[DzwEventRouter alloc] init];
    });
    return router;
}

- (NSMutableDictionary<NSString *, NSInvocation *> *)eventInvocationDict {
    if (_eventInvocationDict == nil) {
        _eventInvocationDict = [NSMutableDictionary dictionary];
    }
    return _eventInvocationDict;
}

- (void)addTarget:(id)target relativeAction:(nonnull SEL)action{
    self.delegate = target;
    SEL selector = action;

    NSInvocation *invocation = [self createInvocationWithSelector:selector];
    if (invocation) {
        self.eventInvocationDict[NSStringFromSelector(action)] = invocation;
    }
}

- (NSInvocation *)createInvocationWithSelector:(SEL)selector {
    if (![self.delegate respondsToSelector:selector]) {
        NSLog(@"[DzwEventRouter] Warning: Target does not respond to selector %@", NSStringFromSelector(selector));
        return nil;
    }

    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self.delegate class] instanceMethodSignatureForSelector:selector]];
    invocation.target = self.delegate;
    invocation.selector = selector;
    return invocation;
}

- (void)registerEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSInvocation *invocation = self.eventInvocationDict[eventName];
    if (invocation) {
        [invocation setArgument:&userInfo atIndex:2];  // 参数从2开始，0和1是self和_cmd
        [invocation invoke];
    } else {
        NSLog(@"[DzwEventRouter] No event associated for eventName: %@", eventName);
    }
}

@end
