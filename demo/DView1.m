//
//  DView1.m
//  MGJRouterDemo
//
//  Created by dzw on 2024/10/23.
//  Copyright © 2024 juangua. All rights reserved.
//

#import "DView1.h"
#import "DView2.h"
#import "DzwEventRouter.h"

@interface DView1 ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) DView2 *v2;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation DView1

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI{
    [self addSubview:self.v2];
    [self addSubview:self.btn1];
    [self addSubview:self.tableView];

    // tableview数据源
    self.dataArray = @[@"Apple", @"Banana", @"Cherry", @"Durian", @"Emblica"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"第%ld种水果:%@",(long)(indexPath.row+1),self.dataArray[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取点击的单元格数据
    NSString *selectedItem = self.dataArray[indexPath.row];

    // 触发事件，将选中的项作为 userInfo 传递
    [[DzwEventRouter shareInstance] handleEvent:@"didSelectRow:" userInfo:@{@"selectedItem": selectedItem,
                                                                            @"tableView":tableView,
                                                                            @"indexPath":indexPath}];
}

#pragma mark - getter /setter
- (DView2 *)v2{
    if(!_v2){
        _v2 = [[DView2 alloc]initWithFrame:CGRectMake(20, 150, self.frame.size.width-40, 200)];
        _v2.backgroundColor = [UIColor.blueColor colorWithAlphaComponent:0.2];
    }
    return _v2;
}

- (UIButton *)btn1{
    if(!_btn1){
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.frame = CGRectMake(0, 64, 100, 44);
        _btn1.backgroundColor = UIColor.orangeColor;
        _btn1.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        [_btn1 setTitle:@"view1内按钮" forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

- (void)btnAction:(UIButton *)sender{
    [[DzwEventRouter shareInstance] handleEvent:@"onView1Event:" userInfo:@{@"source": [self class]}];
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 360, self.frame.size.width-40, 150) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
