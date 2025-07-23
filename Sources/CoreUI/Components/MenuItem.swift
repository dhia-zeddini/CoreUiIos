//
//  MenuItem.swift
//  CoreUI
//
//  Created by Sofrecom on 25/2/2025.
//

import SwiftUI

/// `MenuItem` represents an individual menu entry in the `CustomMenu`.
///
/// It displays an icon, title, and an optional arrow indicator for navigation.
///
/// - Parameters:
///   - item: A `MenuItemModel` that defines the menu item’s properties such as icon, title, and action.
///   - isNavigationPresented : a binding var from `CustomMenu` that handle navigation action
///   - navigationDestination : a binding var from `CustomMenu` that present navigation destination
///
/// # Example
/// ```
/// MenuItem(item: MenuItemModel(icon: "person.fill", title: "Account", ...),isNavigationPresented:
/// $isNavigationPresented,navigationDestination: $navigationDestination)
///
/// ```

public struct MenuItem: View {
    var item: MenuItemModel
    @Binding var isNavigationPresented: Bool
    @Binding var navigationDestination: () -> AnyView

    public init(
        item: MenuItemModel,
        isNavigationPresented: Binding<Bool>,
        navigationDestination: Binding<() -> AnyView>
    ) {
        self.item = item
        _isNavigationPresented = isNavigationPresented
        _navigationDestination = navigationDestination
    }
    public var body: some View {
        Button(action: {
            item.action()

            // If a destination exists, set it and trigger navigation.
            if let destination = item.navigationDestination() {
                navigationDestination = { destination }
                isNavigationPresented = true
            }
        }) {
            HStack(spacing: 16) {
                Image(systemName: item.icon)
                    .foregroundColor(item.iconColor)

                Text(item.title)
                    .foregroundColor(item.textColor)

                Spacer()

                if item.showArrow {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, paddingS)
        }
    }
}
