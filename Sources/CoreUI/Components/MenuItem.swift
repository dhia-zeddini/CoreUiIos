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
///
/// # Example
/// ```
/// MenuItem(item: MenuItemModel(icon: "person.fill", title: "Account", ...))
/// ```

public struct MenuItem: View {
    public init(item: MenuItemModel) {
        self.item = item
    }

    var item: MenuItemModel

    public var body: some View {
        Button(action: item.action) {
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
