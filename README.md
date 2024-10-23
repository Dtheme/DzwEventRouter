# DzwEventRouter

**DzwEventRouter** 是一个用于 iOS 应用的事件路由管理工具，采用事件总线模式，方便视图与控制器之间的解耦通信。

在传统的 iOS 开发中，当视图层级较深时，通常使用 Delegate 或 Block 进行事件传递。然而，随着层级的加深，反向代理的链条可能会变得非常复杂，导致代码耦合度高，难以维护。

DzwEventRouter 提供了一种更为优雅和灵活的事件路由机制，通过集中管理事件的注册与处理，减少了视图层级深度带来的代码复杂性。
避免层层传递代理：使用 DzwEventRouter，子视图不再需要通过层层代理将事件传递到父视图或控制器，而是直接通过事件路由器发送事件，大大降低了视图层之间的耦合。
提升代码可维护性：将事件管理集中到 DzwEventRouter，可以让代码结构更加清晰，事件的注册和处理逻辑集中管理，避免了复杂的代理模式带来的维护难题。
更灵活的事件处理机制：通过 userInfo 传递自定义参数，并结合装饰模式扩展事件数据，使事件在不同视图间的传递更加灵活、轻便。

## 功能特性

- **简化事件注册**：在视图和控制器之间通过简单的 API 进行事件注册与监听。
- **解耦事件处理**：将事件的发出方与接收方解耦，提升代码的可维护性。
- **灵活的事件传递机制**：支持通过 `userInfo` 传递自定义的事件参数，并自动处理响应。
- **支持链式事件传播**：支持事件的链式传递，方便事件沿调用链进行逐层分发。

## 安装

### 使用 CocoaPods 安装

1. 在项目的 `Podfile` 中添加以下内容：

    ```ruby
    pod 'DzwEventRouter'
    ```

2. 运行 `pod install` 命令安装依赖。

### 手动集成

1. 克隆或下载该仓库的代码。
2. 将 `DzwEventRouter` 文件夹添加到您的项目中。

## 使用方法

### 1. 注册事件

您可以在需要监听事件的 `vc` 中注册一个事件，并指定事件的处理方法。

```objc
[[DzwEventRouter shareInstance] registerEventWithName:@"cellSelected:" target:self];

- (void)cellSelected:(NSDictionary *)userInfo {
    NSLog(@"Selected item: %@", userInfo[@"selectedItem"]);
}
```

### 2. 触发事件

当事件触发时，可以通过 `handleEvent:userInfo:` 方法将事件传递给注册的监听者。

```objc
[[DzwEventRouter shareInstance] handleEvent:@"cellSelected:" userInfo:@{@"selectedItem": @"Item 1"}];
```

### 3. 在子视图中触发事件

在子视图中，可以通过 `DzwEventRouter` 触发事件并传递相关信息到控制器：

```objc
[self routerEventWithName:@"buttonClicked" userInfo:@{@"key": @"value"}];
```

### 4. 使用装饰模式扩展事件信息

框架支持使用装饰模式对事件的 `userInfo` 进行扩展，使得每个事件传递更多的信息。

```objc
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSMutableDictionary *decoratorDic = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [decoratorDic setObject:@"MoreInfo" forKey:@"Decorator"];
    [[DzwEventRouter shareInstance] handleEvent:eventName userInfo:decoratorDic];
}
```

## 代码示例

### 表格视图示例

在表格视图中，当某个单元格被点击时，触发事件并在控制器中处理该事件。

```objc
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedItem = self.dataArray[indexPath.row];
    [[DzwEventRouter shareInstance] handleEvent:@"cellSelected:" userInfo:@{@"selectedItem": selectedItem}];
}

- (void)cellSelected:(NSDictionary *)userInfo {
    NSLog(@"Selected item: %@", userInfo[@"selectedItem"]);
}
```

## 许可证

本项目基于 MIT 许可证开源，详情请查看 [LICENSE](LICENSE) 文件。

