//
//  UIViewController+EventRouter.m
//  MGJRouterDemo
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 juangua. All rights reserved.
//

#import "UIViewController+EventRouter.h"

@implementation UIViewController (EventRouter)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    NSMutableDictionary *decoratorDic = [NSMutableDictionary dictionaryWithDictionary:userInfo];

    // 传递事件给 DzwEventRouter
    [[DzwEventRouter shareInstance] handleEvent:eventName userInfo:decoratorDic];

}

@end
