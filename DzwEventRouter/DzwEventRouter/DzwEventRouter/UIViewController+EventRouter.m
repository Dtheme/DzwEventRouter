//
//  UIViewController+EventRouter.m
//  DzwEventRouter
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 dzw. All rights reserved.
//

#import "UIViewController+EventRouter.h"

@implementation UIViewController (EventRouter)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    NSMutableDictionary *decoratorDic = [NSMutableDictionary dictionaryWithDictionary:userInfo];

    // 传递事件给 DzwEventRouter
    [[DzwEventRouter shareInstance] registerEvent:eventName userInfo:decoratorDic];

}

@end
