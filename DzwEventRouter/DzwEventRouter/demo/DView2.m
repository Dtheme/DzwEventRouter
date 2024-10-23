//
//  DView2.m
//  MGJRouterDemo
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 juangua. All rights reserved.
//

#import "DView2.h"
#import "DzwEventRouter.h"

@interface DView2 ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation DView2

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self addSubview:self.btn];
}

- (UIButton *)btn{
    if(!_btn){
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(0, 0, 100, 100);
        _btn.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        _btn.backgroundColor = UIColor.orangeColor;
        [_btn setTitle:@"view2内按钮" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (void)btnAction:(UIButton *)sender{
    [[DzwEventRouter shareInstance] handleEvent:@"onView2Event:" userInfo:@{@"source": [self class]}];
}
@end
