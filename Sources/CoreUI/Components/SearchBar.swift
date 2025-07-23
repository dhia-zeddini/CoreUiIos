//
//  SearchBar.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 16/4/2025.
//

import SwiftUI

/// A customizable search bar component for SwiftUI, with support for placeholder, callbacks, cancel button, and visual styling.
///
/// - Parameters:
///   - searchText: A binding to the search text.
///   - hint: The placeholder text when the field is empty.
///   - font: The font used in the text field.
///   - width: The width of the search bar.
///   - height: The height of the search bar.
///   - radius: The corner radius of the search bar.
///   - hasShadow: Whether to display a shadow. Default is `true`.
///   - hasCancel: Whether to show the cancel (clear) button. Default is `true`.
///   - shadowColor: The shadow color. Default is `.primaryColor`.
///   - onCommit: Action to perform on search commit.
///   - onStartEditing: Action when editing begins.
///   - onEndEditing: Action when editing ends.
///   - onChange: Action on text change.
///   - onCancel: Action on cancel/clear button tap.
public struct SearchBar: View {
    
    // MARK: - Internal State
    
    /// Tracks if the user is currently typing in the search field.
    @State private var isTyping: Bool = false
    
    // MARK: - Input Bindings and Parameters
    
    /// Two-way binding to the search text.
    @Binding var searchText: String
    
    /// Placeholder text displayed when the search field is empty.
    let hint: String
    
    /// Font used for the text input.
    let font: Font
    
    /// Width of the search bar.
    let width: CGFloat
    
    /// Height of the search bar.
    let height: CGFloat
    
    /// Corner radius of the search bar.
    let radius: CGFloat
    
    /// Whether the search bar has a drop shadow. Default is `true`.
    let hasShadow: Bool
    
    /// Whether the cancel (clear) button is shown when the field has text. Default is `true`.
    let hasCancel: Bool
    
    /// Background Color . Default is `.white`.
    let backgroundColor: Color

    /// Forground Color . Default is `.primaryColor`.
    let forgroundColor: Color

    /// Color of the shadow. Default is `.primaryColor`.
    let shadowColor: Color
    
    // MARK: - Callback Closures
    
    /// Called when the user commits their search (e.g., presses return).
    var onCommit: () -> Void
    
    /// Called when the user begins editing the search field.
    var onStartEditing: () -> Void
    
    /// Called when the user ends editing the search field.
    var onEndEditing: () -> Void
    
    /// Called every time the `searchText` value changes.
    var onChange: () -> Void
    
    /// Called when the cancel (clear) button is tapped.
    var onCancel: () -> Void
    
    // MARK: - Initializer
    
    /// Initializes a new `SearchBar` view.
    public init(
        searchText: Binding<String>,
        hint: String,
        font: Font = .caption,
        width: CGFloat = ScreenSize.width * 0.7,
        height: CGFloat = 40,
        radius: CGFloat = 25,
        hasShadow: Bool = true,
        hasCancel: Bool = true,
        backgroundColor: Color = .white,
        forgroundColor: Color = .primaryColor,
        shadowColor: Color = .primaryColor,
        onCommit: @escaping () -> Void = {},
        onStartEditing: @escaping () -> Void = {},
        onEndEditing: @escaping () -> Void = {},
        onChange: @escaping () -> Void = {},
        onCancel: @escaping () -> Void = {}
    ) {
        self._searchText = searchText
        self.hint = hint
        self.font = font
        self.width = width
        self.height = height
        self.radius = radius
        self.hasShadow = hasShadow
        self.hasCancel = hasCancel
        self.backgroundColor = backgroundColor
        self.forgroundColor = forgroundColor
        self.shadowColor = shadowColor
        self.onCommit = onCommit
        self.onStartEditing = onStartEditing
        self.onEndEditing = onEndEditing
        self.onChange = onChange
        self.onCancel = onCancel
    }
    
    // MARK: - View Body
    
    public var body: some View {
        HStack {
            // Magnifying glass icon shown when no text
            if searchText.isEmpty {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
            }
            
            // Text field with dynamic actions
            TextField(
                hint,
                text: $searchText,
                onEditingChanged: { isBegin in
                    if isBegin {
                        onStartEditing()
                        print("Begins editing")
                    } else {
                        onEndEditing()
                        print("Finishes editing")
                    }
                },
                onCommit: onCommit
            )
            .font(font)
            .onChange(of: searchText) { _ in
                onChange()
            }
            
            // Cancel button shown when there's text
            if !searchText.isEmpty && hasCancel {
                Button(action: {
                    searchText = ""
                    onCancel()
                }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                }
            }
        }
        .padding()
        .frame(width: width, height: height)
        .background(backgroundColor)
        .foregroundColor(forgroundColor)
        .cornerRadius(radius)
        .shadow(color: hasShadow ? shadowColor : Color.clear, radius: 3)
    }
}
