# DzwEventRouter

[中文](https://github.com/Dtheme/DzwEventRouter/blob/main/README.md) | [English](https://github.com/Dtheme/DzwEventRouter/blob/main/README-en.md)

---

`DzwEventRouter` is a lightweight event routing utility for iOS applications. It enables flexible communication between different components through a `target-action` pattern, making it easier to handle custom events.

### Features

- **Target-action Event Registration**: Register responder chain events from child levels to a specified parent view using a non-delegation method with target-action registration.

## Why DzwEventRouter
`DzwEventRouter` provides a more elegant and flexible event routing mechanism, centralizing event registration and handling to reduce the code complexity caused by deep view hierarchies.

- **Eliminates Multi-level Delegate Passing**: With `DzwEventRouter`, child views no longer need to pass events up through multiple layers of delegates to reach the parent view or controller. Instead, events are sent directly through the event router, significantly reducing coupling between view layers.
- **Enhances Code Maintainability**: Centralizing event management in `DzwEventRouter` makes code structure clearer, with event registration and handling logic managed in one place, avoiding the maintenance challenges of complex delegate patterns.
- **More Flexible Event Handling**: `DzwEventRouter` allows custom parameters to be passed via `userInfo` and extends event data with the decorator pattern, making event transmission between different views more flexible and lightweight.
- 
### Installation

You can install `DzwEventRouter` in two ways:

1. **Manual Installation**: Copy the files in the `DzwEventRouter` folder directly into your project.
2. **Using CocoaPods**: Add the following line to your `Podfile`:
   ```ruby
   pod 'DzwEventRouter', '~> 1.0.0'
   ```

## Usage

import:
```objc
#import "EventRouterHeader.h"
```

### Register an Event

In the `ViewController`, register an event by providing the handler target and action.

```objc
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Register the event with a target and action
    [[DzwEventRouter shareInstance] addTarget:self relativeAction:@selector(onCustomEvent:)];
}

// Event handling method
- (void)onCustomEvent:(NSDictionary *)userInfo {
    NSLog(@"Received event with userInfo: %@", userInfo);
}
```

### Trigger an Event

In another component, trigger the registered event.
Example with a Button in a ViewController’s Subview：
```objc
[button addTarget:self action:@selector(triggerEvent:) forControlEvents:UIControlEventTouchUpInside];

- (void)triggerEvent {
    [[DzwEventRouter shareInstance] handleEvent:@"onCustomEvent:" userInfo:@{@"source": [self class]}];
}
```

## Notes

- Use `addTarget:relativeAction:` for event registration instead of the deprecated `registerEventWithName:target:`.
- Ensure the `target` contains the method corresponding to the registered action; otherwise, the event will not be handled.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
