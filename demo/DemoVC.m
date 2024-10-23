//
//  DemoVC.m
//  MGJRouterDemo
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 juangua. All rights reserved.
//

#import "DemoVC.h"
#import "DView1.h"
#import "DView3.h"
#import "EventRouterHeader.h"

@interface DemoVC ()
@property (nonatomic, strong) DView1 *v1;
@property (nonatomic, strong) DView3 *v3;
@end

@implementation DemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.v1];
    [self.view addSubview:self.v3];

    // 注册事件，方法名为 onCustomEvent:
    [[DzwEventRouter shareInstance] registerEventWithName:@"onView1Event:" target:self];
    [[DzwEventRouter shareInstance] registerEventWithName:@"onView2Event:" target:self];
    [[DzwEventRouter shareInstance] registerEventWithName:@"didSelectRow:" target:self];
    [[DzwEventRouter shareInstance] registerEventWithName:@"onView3TouchEvent:" target:self];
}

- (void)onView2Event:(NSDictionary *)userInfo {
    NSLog(@"onView2Event响应 userInfo: %@", userInfo);
}

- (void)onView1Event:(NSDictionary *)userInfo {
    NSLog(@"onView1Event响应 userInfo: %@", userInfo);
}
- (void)onView3TouchEvent:(NSDictionary *)userInfo {
    NSLog(@"onView3TouchEvent响应 userInfo: %@", userInfo);
}

- (void)didSelectRow:(NSDictionary *)userInfo {
    NSLog(@"didSelectRow响应 userInfo: %@", userInfo);
}
- (DView1 *)v1{
    if(!_v1){
        _v1 = [[DView1 alloc]initWithFrame:CGRectMake(10, 20, UIScreen.mainScreen.bounds.size.width-20, UIScreen.mainScreen.bounds.size.height-100)];
        _v1.backgroundColor = [UIColor.greenColor colorWithAlphaComponent:0.2];
    }
    return _v1;
}

- (DView3 *)v3{
    if(!_v3){
        _v3 = [[DView3 alloc]initWithFrame:CGRectMake(10, UIScreen.mainScreen.bounds.size.height-80, UIScreen.mainScreen.bounds.size.width-20, 60)];
        _v3.backgroundColor = [UIColor.redColor colorWithAlphaComponent:0.2];
    }
    return _v3;
}
@end
