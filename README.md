# DzwEventRouter

[中文](https://github.com/Dtheme/DzwEventRouter/blob/main/README.md) | [English](https://github.com/Dtheme/DzwEventRouter/blob/main/README-en.md)

---

`DzwEventRouter` 是一个轻量级的 iOS 事件路由工具。通过 `target-action` 模式实现灵活的组件间事件通信，便于处理自定义事件。

### 功能

- **target-action事件注册**: 将响应链事件子层级的时间使用非反向代理的方式注册到指定父视图，target-action方式注册

### 安装

支持2种方式安装使用：
1. 将 `DzwEventRouter` 文件夹中的文件复制到项目中即可使用。
2. 支持`cocoapod`:
  ```
  pod 'DzwEventRouter', '~> 1.0.0'
  ```

### 使用示例

### 注册事件

在 `ViewController` 中，通过指定 `target` 和 `action` 来注册事件。

```
#import "DzwEventRouter.h"

- (void)viewDidLoad {
    [super viewDidLoad];

    // 注册事件，指定 target 和 action
    [[DzwEventRouter shareInstance] addTarget:self relativeAction:@selector(onCustomEvent:)];
}

// 事件处理方法
- (void)onCustomEvent:(NSDictionary *)userInfo {
    NSLog(@"收到事件，userInfo: %@", userInfo);
}

```

### 触发事件

在其他组件中，或者子视图中，触发已注册的事件。

```
#import "DzwEventRouter.h"

- (void)triggerEvent {
    [[DzwEventRouter shareInstance] handleEvent:@"onCustomEvent:" userInfo:@{@"source": [self class]}];
}

```

### 注意事项

- 建议使用 `addTarget:relativeAction:` 进行事件注册。
- 确保 `target` 包含与注册的 `action` 方法对应的实现，否则事件将无法处理。

### 许可证

本项目使用 MIT 许可证，详见 [LICENSE](https://github.com/Dtheme/DzwEventRouter/blob/main/LICENSE) 文件。
