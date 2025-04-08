//
//  PickerSection.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 8/4/2025.
//

import SwiftUI

/// A reusable section for displaying a picker.
///
/// - Parameters:
///   - title: The title of the section.
///   - isLoading: Whether the section is currently loading data.
///   - items: The items to display in the picker.
///   - selection: The currently selected item.
///   - content: A closure to generate the content for each item.
public struct PickerSection<Item: Identifiable & Equatable & Hashable, Content: View>: View {
    let title: String
    let isLoading: Bool
    let height: CGFloat
    let items: [Item]
    @Binding var selection: Item?
    @ViewBuilder let content: (Item) -> Content
    
    public init(title: String, isLoading: Bool,height:CGFloat = 50, items: [Item], selection: Binding<Item?>, content: @escaping (Item) -> Content) {
        self.title = title
        self.isLoading = isLoading
        self.height = height
        self.items = items
        self._selection = selection
        self.content = content
    }
    public var body: some View {
        HStack {
            Text(title)
                .font(.callout)
                .foregroundStyle(.secondary.opacity(0.7))
            Spacer()
            
            if isLoading {
                ProgressView()
            } else {
                Picker("", selection: $selection) {
                    ForEach(items) { item in
                        content(item).tag(item as Item?)
                    }
                }
            }
        }.frame(height: height)
    }
}
