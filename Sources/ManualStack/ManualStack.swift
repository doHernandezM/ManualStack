//
//  AdaptiveStack.swift
//  ARPinView
//
//  Created by Dennis Hernandez on 9/24/21.
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-automatically-switch-between-hstack-and-vstack-based-on-size-class

//JIC we are in linux
#if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
import SwiftUI

public enum StackType {
    case Vertical, Horizontal
}

/// Adaptive stack lets you conditionally choose a vstack or hstack
///
/// Call this just like a normal stack, except pass a ``StackType`` to let it know how to behave.
///
/// Example:
///
///     ManualStack(stackType: .Vertical){
///         ForEach(allInTheRainbowsColors, id:\.self){ color in
///             Rectangle()
///                 .frame(width: 200.0, height:50.0)
///                 .foregroundColor(color)
///        }
///     }
///
/// I very much stole and butcher this from [Hacking With Swift](https://www.hackingwithswift.com/quick-start/swiftui/how-to-automatically-switch-between-hstack-and-vstack-based-on-size-class)
public struct ManualStack<Content: View>: View {
    ///Set this to ``StackType`` `Vertical` for a `VStack` and `Horizontal` for and `HStack`.
    public var isVertical:Bool = true
    public let horizontalAlignment: HorizontalAlignment
    public let verticalAlignment: VerticalAlignment
    public let spacing: CGFloat?
    public let content: () -> Content
    
    public init(isVertical:Bool, horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.isVertical = isVertical
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }
    
    public var body: some View {
        Group {
            if isVertical == true {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        ManualStack(isVertical: false) {
            Text("""
Horizontal when there's lots of space\r
but\r
Vertical when space is restricted
""")
        }
    }
}
#endif
