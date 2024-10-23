//
//  DView3.m
//  MGJRouterDemo
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 juangua. All rights reserved.
//

#import "DView3.h"
#import "DzwEventRouter.h"

@implementation DView3

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:self.bounds];
        label.text = @"view3";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = UIColor.whiteColor;
        label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        [self addSubview:label];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[DzwEventRouter shareInstance] handleEvent:@"onView2Event:" userInfo:@{@"source": [self class]}];
}

@end
