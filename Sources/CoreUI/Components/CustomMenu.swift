//
//  CustomMenu.swift
//  CoreUI
//
//  Created by Sofrecom on 25/2/2025.
//

import SwiftUI

/// `CustomMenu` is a reusable component that displays a vertical list of menu items.
///
/// Each menu item is defined by the `MenuItemModel` structure and performs a specific action when tapped.
///
/// - Parameters:
///   - menuItems: An array of `MenuItemModel` objects representing the menu options.
///
/// # Example
/// ```
/// CustomMenu(menuItems: [MenuItemModel(icon: "gearshape", title: "Settings", ...)])
/// ```

public struct CustomMenu: View {
    let menuItems: [MenuItemModel]
    @State private var isNavigationPresented: Bool = false
    @State private var navigationDestination: () -> AnyView = {
        AnyView(EmptyView())
    }

    public init(menuItems: [MenuItemModel]) {
        self.menuItems = menuItems
    }

    public var body: some View {
        if #available(iOS 16.0, *) {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(menuItems, id: \.id) { item in
                        MenuItem(
                            item: item,
                            isNavigationPresented: $isNavigationPresented,
                            navigationDestination: $navigationDestination
                        )
                    }
                }
            }.navigationDestination(isPresented: $isNavigationPresented) {
                navigationDestination()
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
