//
//  FilterButtonModel.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 15/4/2025.
//

import SwiftUI

/// A model representing the properties for a single filter button in a list view.
///
/// - Properties:
///   - title: The display text for the filter button.
///   - systemName: The system image name used for the button icon.
///   - color: The color applied to the icon.
public struct FilterButtonModel: Identifiable, Hashable {
    public let id = UUID()
    public let title: String
    public let systemName: String?
    public let color: Color?

    /// Initializes a new filter button model.
    /// - Parameters:
    ///   - title: The display text for the filter button.
    ///   - systemName: The system image name for the icon.
    ///   - color: The color to use for the icon.
    public init(title: String, systemName: String? = nil, color: Color? = nil) {
        self.title = title
        self.systemName = systemName
        self.color = color
    }
}

