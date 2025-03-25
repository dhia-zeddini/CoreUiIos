//
//  MenuItemModel.swift
//  CoreUI
//
//  Created by Sofrecom on 25/2/2025.
//

import Foundation
import SwiftUI

/// `MenuItemModel` defines the structure for menu entries used in the `CustomMenu`.
///
/// Each model contains data for the icon, title, and action, along with optional styling configurations.
///
/// - Parameters:
///   - icon: System image name for the menu icon.
///   - title: The text displayed for the menu item.
///   - isDestructive: Marks the item as destructive (e.g., logout).
///   - showArrow: Determines whether a right arrow is shown for navigation.
///   - action: Closure that defines the action performed when the item is selected.
///
/// # Example
/// ```
/// MenuItemModel(icon: "rectangle.portrait.and.arrow.right",
///               title: "Logout",
///               isDestructive: true,
///               showArrow: false,
///               action: { router.navigate(to: .auth) })
/// ```

public struct MenuItemModel: Identifiable {
    public let id = UUID()
    let icon: String
    let title: String
    let isDestructive: Bool
    let showArrow: Bool
    let action: () -> Void

    @MainActor
    var iconColor: Color {
        isDestructive ? .red : .primaryColor
    }
    @MainActor
    var textColor: Color {
        isDestructive ? .red : .primaryColor
    }

    public init(
        icon: String, title: String, isDestructive: Bool, showArrow: Bool,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.title = title
        self.isDestructive = isDestructive
        self.showArrow = showArrow
        self.action = action
    }
}
