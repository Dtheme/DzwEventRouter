//
//  UIViewController+EventRouter.h
//  DzwEventRouter
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 juangua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DzwEventRouter.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (EventRouter)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
