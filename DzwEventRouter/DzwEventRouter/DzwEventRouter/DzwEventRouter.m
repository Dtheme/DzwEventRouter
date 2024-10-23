//
//  DzwEventRouter.m
//  MGJRouterDemo
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 juangua. All rights reserved.
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

- (void)registerEventWithName:(NSString *)eventName target:(UIViewController *)target {
    self.delegate = target;
    SEL selector = NSSelectorFromString(eventName);

    // 创建并存储 Invocation
    NSInvocation *invocation = [self createInvocationWithSelector:selector];
    if (invocation) {
        self.eventInvocationDict[eventName] = invocation;
    }
}

- (NSInvocation *)createInvocationWithSelector:(SEL)selector {
    if (![self.delegate respondsToSelector:selector]) {
        NSLog(@"Warning: Target does not respond to selector %@", NSStringFromSelector(selector));
        return nil;
    }

    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self.delegate class] instanceMethodSignatureForSelector:selector]];
    invocation.target = self.delegate;
    invocation.selector = selector;
    return invocation;
}

- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSInvocation *invocation = self.eventInvocationDict[eventName];
    if (invocation) {
        [invocation setArgument:&userInfo atIndex:2];  // 参数从2开始，0和1是self和_cmd
        [invocation invoke];
    } else {
        NSLog(@"No event registered for eventName: %@", eventName);
    }
}

@end
