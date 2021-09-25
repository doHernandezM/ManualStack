# ManualStack

##Manual stack lets you conditionally choose a `VStack` or `HStack`.

Call this just like a normal stack, except pass a ``StackType`` to let it know how to behave. Set the ManualStack's ``Stacktype`` to `Vertical` for a `VStack` and `Horizontal` for and `HStack`.

Example:

```swift
ManualStack(stackType: .Vertical){
    ForEach(allInTheRainbowsColors, id:\.self){ color in
        Rectangle()
            .frame(width: 200.0, height:50.0)
            .foregroundColor(color)
    }
}
```
I very much stole and butchered this from [Hacking With Swift](https://www.hackingwithswift.com/quick-start/swiftui/how-to-automatically-switch-between-hstack-and-vstack-based-on-size-class)
