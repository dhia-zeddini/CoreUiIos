//
//  SwiftUIView.swift
//  CoreUI
//
//  Created by Sofrecom on 19/2/2025.
//

import SwiftUI
/// `CustomTextFieldWithIcon` is a customizable text field component with an icon and optional password visibility toggle.
///
/// - Parameters:
///   - value: A binding to the text field's value.
///   - hint: The placeholder text displayed inside the text field.
///   - icon: The icon displayed alongside the text field.
///   - isSecure: A boolean flag that determines if the field should behave as a secure entry (e.g., password field).
///   - maxWidth: The maximum width of the text field (default is `.infinity`).
///   - maxHeight: The maximum height of the text field (default is `50`).
///   - keyboardType: The type of keyboard to display (e.g., `.emailAddress`, `.numberPad`).
///
/// # Example
/// ```
/// CustomTextFieldWithIcon(
///     value: $password,
///     hint: "Mot de passe",
///     icon: "lock.fill",
///     isSecure: true
/// )
/// ```
public struct CustomTextFieldWithIcon: View {
    @Binding var value: String
    let hint: String
    let icon: String
    let isSecure: Bool
    let withStyle: Bool
    let maxWidth: CGFloat
    let maxHeight: CGFloat
    let keyboardType: UIKeyboardType
    @State private var showPassword: Bool = false

    public init(
        value: Binding<String>,
        hint: String,
        icon: String,
        isSecure: Bool = false,
        withStyle: Bool = true,
        maxWidth: CGFloat = .infinity,
        maxHeight: CGFloat = 50,
        keyboardType: UIKeyboardType = .default
    ) {
        self._value = value
        self.hint = hint
        self.icon = icon
        self.isSecure = isSecure
        self.withStyle = withStyle
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.keyboardType = keyboardType
    }
    public var body: some View {
        HStack {
            if withStyle {
                CircularIcon(icon: icon, maxWidth: maxHeight, maxHeight: maxHeight)
            }
            textField
                .keyboardType(keyboardType)
            Spacer()
            passwordToggle
        }
        .frame(maxHeight: maxHeight)
        .background(
            ZStack{
                if withStyle{
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.primaryColor, lineWidth: 2)
                        .shadow(radius: 1)
                }
            }
        )
        
    }
    // MARK: - TextField Component
    @ViewBuilder
    private var textField: some View {
        if isSecure && !showPassword {
            SecureField(hint, text: $value)
        } else {
            TextField(hint, text: $value)
        }
    }

    // MARK: - Password Toggle Button
    @ViewBuilder
    private var passwordToggle: some View {
        if isSecure {
            Button(action: { showPassword.toggle() }) {
                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(.primaryColor)
            }
            .padding(.trailing, 10)
        }
    }
}
