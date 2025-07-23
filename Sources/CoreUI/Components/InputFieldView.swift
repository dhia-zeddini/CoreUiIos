//
//  InputFieldView.swift
//  CoreUI
//
//  Created by Sofrecom on 20/2/2025.
//

import SwiftUI

/// `InputFieldView` is a reusable input field component that displays a text field with an icon,
/// along with error validation messaging.
///
/// This view utilizes `CustomTextFieldWithIcon` for consistent styling and functionality.
///
/// - Parameters:
///   - field: An `InputFieldModel` object that holds the text value, hint, icon, secure entry status,
///            keyboard type, and potential validation error.
///
/// # Example
/// ```
/// InputFieldView(field: InputFieldModel(
///     value: "",
///     hint: "Email",
///     icon: "envelope.fill",
///     isSecure: false,
///     keyboardType: .emailAddress
/// ))
/// ```
///
/// # Behavior
/// - The text field's value is updated using a two-way binding (`@ObservedObject`).
/// - Whenever the value changes, the `.validate()` method is triggered for real-time validation.
/// - If there's a validation error, the error message is displayed in red text below the field.
public struct InputFieldView: View {
    
    /// The observed object that contains the text field's data and logic.
    @ObservedObject var field: InputFieldModel

    let withStyle: Bool

    /// Initializes the `InputFieldView`.
    /// - Parameters:
    ///   - field: An instance of `InputFieldModel` for managing text input and validation.
    ///   - withStyle : A boolean that indicate if the CustomTextFieldWithIcon will have a style or not
    public init(field: InputFieldModel, withStyle: Bool = true) {
        self.field = field
        self.withStyle = withStyle
    }

    /// The body of the view, consisting of:
    /// - A `CustomTextFieldWithIcon` for text entry.
    /// - An error message displayed in red if validation fails.
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            CustomTextFieldWithIcon(
                value: Binding(
                    get: { field.value },
                    set: { newValue in
                        field.value = newValue
                        field.validate()
                    }
                ),
                hint: field.hint,
                icon: field.icon,
                isSecure: field.isSecure,
                withStyle:withStyle,
                keyboardType: field.keyboardType
            )
            
            // Displays the error message if present
            if let error = field.error, !error.isEmpty {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
    }
}
