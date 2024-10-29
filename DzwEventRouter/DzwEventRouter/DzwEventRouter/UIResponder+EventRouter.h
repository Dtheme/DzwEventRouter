//
//  UIResponder+EventRouter.h
//  DzwEventRouter
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 juangua. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (EventRouter)
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

/// 响应链事件映射
/// - (NSDictionary *)d_RouteEventMap {
///     return @{@"test1":[self createInvocationWithSelector:@selector(test:)],
///              @"container":[self createInvocationWithSelector:@selector(container:)]
///              };
/// }
- (NSDictionary *)routeEventMap;
@end

NS_ASSUME_NONNULL_END
