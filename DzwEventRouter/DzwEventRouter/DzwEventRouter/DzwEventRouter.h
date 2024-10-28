//
//  DzwEventRouter.h
//  MGJRouterDemo
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 juangua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DzwEventRouter : NSObject

@property (nonatomic, weak) id middleman;
@property (nonatomic, weak) id receiver;

@property (nonatomic, strong) NSMutableDictionary <NSString *, NSInvocation *> *eventInvocationDict;

+ (__kindof DzwEventRouter *)shareInstance;

// 注册事件
- (void)registerEventWithName:(NSString *)eventName target:(UIViewController *)target __attribute__((deprecated("Use ‘-addSubTarget:(id)target action:(nonnull SEL)action’ instead")));
- (void)addTarget:(id)target relativeAction:(nonnull SEL)action;

// 处理事件
- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *__nullable)userInfo;

@end

NS_ASSUME_NONNULL_END


