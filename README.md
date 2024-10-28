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
### 方法

### 单例方法

```
+ (__kindof DzwEventRouter *)shareInstance;

```

返回 `DzwEventRouter` 的共享实例，用于所有事件的注册与处理。

### 注册事件

> 注意：registerEventWithName:target: 方法已被废弃，建议使用 addTarget:relativeAction: 注册事件。
> 

### 废弃方法

```
- (void)registerEventWithName:(NSString *)eventName target:(UIViewController *)target __attribute__((deprecated("Use ‘-addSubTarget:(id)target action:(nonnull SEL)action’ instead")));

```

使用指定的 `eventName` 和 `target` 注册事件。该方法已废弃，建议改用 `addTarget:relativeAction:`。

### 新增方法

```
- (void)addTarget:(id)target relativeAction:(nonnull SEL)action;

```

- **target**：处理事件的对象。
- **action**：事件触发时调用的选择器（`SEL`）。

### 触发事件

```
- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *__nullable)userInfo;

```

通过指定的 `eventName` 触发事件，并传递可选的 `userInfo` 字典。`DzwEventRouter` 将调用与事件关联的 `target-action` 方法来处理事件。

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
