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
    
    public init(menuItems: [MenuItemModel]) {
        self.menuItems = menuItems
    }
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(menuItems, id: \.id) { item in
                    MenuItem(item: item)
                }
            }
        }
    }
}
