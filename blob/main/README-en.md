# DzwEventRouter

`DzwEventRouter` is a lightweight event routing utility for iOS applications. It enables flexible communication between different components through a `target-action` pattern, making it easier to handle custom events.

## Features

- **Singleton Access**: Retrieve the single shared instance of `DzwEventRouter` through `shareInstance`.
- **Target-Action Event Registration**: Register events with target-action pairs for greater flexibility and modularity.
- **Custom Event Handling**: Trigger registered events and pass additional information using a `userInfo` dictionary.

## Installation

Simply copy the `DzwEventRouter` files into your project.

## Methods

### Singleton

```objc
+ (__kindof DzwEventRouter *)shareInstance;
```

Returns the shared `DzwEventRouter` instance, which is used for all event registrations and handling.

### Registering Events

> **Note**: The method `registerEventWithName:target:` is deprecated. Use `addTarget:relativeAction:` for event registration.

#### Deprecated Method

```objc
- (void)registerEventWithName:(NSString *)eventName target:(UIViewController *)target __attribute__((deprecated("Use ‘-addSubTarget:(id)target action:(nonnull SEL)action’ instead")));
```

Registers an event with the specified `eventName` and `target`. This method is deprecated in favor of `addTarget:relativeAction:`.

#### New Method

```objc
- (void)addTarget:(id)target relativeAction:(nonnull SEL)action;
```

- **target**: The object that will handle the event.
- **action**: The selector in the target that will be called when the event is triggered.

### Handling Events

```objc
- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *__nullable)userInfo;
```

Triggers an event with the specified `eventName`, passing optional `userInfo`. `DzwEventRouter` will invoke the registered `target-action` method associated with the event.

## Usage

### Register an Event

In the `ViewController`, register an event by providing the handler target and action.

```objc
#import "DzwEventRouter.h"

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

```objc
#import "DzwEventRouter.h"

- (void)triggerEvent {
    [[DzwEventRouter shareInstance] handleEvent:@"onCustomEvent:" userInfo:@{@"source": [self class]}];
}
```

## Notes

- Use `addTarget:relativeAction:` for event registration instead of the deprecated `registerEventWithName:target:`.
- Ensure the `target` contains the method corresponding to the registered action; otherwise, the event will not be handled.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
