# DzwEventRouter

[中文](https://github.com/Dtheme/DzwEventRouter/blob/main/README.md) | [English](https://github.com/Dtheme/DzwEventRouter/blob/main/README-en.md)

---

`DzwEventRouter` 是一个轻量级的 iOS 事件路由工具。通过 `target-action` 模式实现灵活的组件间事件通信，便于处理自定义事件。

### 功能

- **target-action事件注册**: 将响应链事件子层级的时间使用非反向代理的方式注册到指定父视图，target-action方式注册

### 解决什么问题

DzwEventRouter 提供了一种更为优雅和灵活的事件路由机制，通过集中管理事件的注册与处理，减少了视图层级深度带来的代码复杂性。
避免层层传递代理：使用 DzwEventRouter，子视图不再需要通过层层代理将事件传递到父视图或控制器，而是直接通过事件路由器发送事件，大大降低了视图层之间的耦合。
提升代码可维护性：将事件管理集中到 DzwEventRouter，可以让代码结构更加清晰，事件的注册和处理逻辑集中管理，避免了复杂的代理模式带来的维护难题。
更灵活的事件处理机制：通过 userInfo 传递自定义参数，并结合装饰模式扩展事件数据，使事件在不同视图间的传递更加灵活、轻便。

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
