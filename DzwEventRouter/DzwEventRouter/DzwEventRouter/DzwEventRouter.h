//
//  DzwEventRouter.h
//  DzwEventRouter
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 dzw. All rights reserved.
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
- (void)registerEvent:(NSString *)eventName userInfo:(NSDictionary *__nullable)userInfo;

// 关联事件
- (void)addTarget:(id)target relativeAction:(nonnull SEL)action;


@end

NS_ASSUME_NONNULL_END

NS_INLINE void RegisterEvent(NSString *_Nonnull eventName, NSDictionary * _Nullable userInfo ) {
    [[DzwEventRouter shareInstance] registerEvent:eventName userInfo:userInfo];
}

