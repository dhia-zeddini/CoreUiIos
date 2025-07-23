//
//  InputFieldModel.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 13/4/2025.
//

import Foundation
import SwiftUI

/// `InputFieldModel` represents a single input field's data and behavior.
///
/// This model holds the field's value, error state, and validation logic.
public class InputFieldModel: ObservableObject, Identifiable {
    public let id = UUID()
    public let hint: String
    public let icon: String
    public let type: String
    public let keyboardType: UIKeyboardType
    public let isSecure: Bool
    @Published public var value: String
    @Published public var error: String?

    public var validation: ((String) -> String?)?

    public init(
        hint: String,
        icon: String,
        type: String = "",
        keyboardType: UIKeyboardType = .default,
        isSecure: Bool = false,
        value: String = "",
        validation: ((String) -> String?)? = nil
    ) {
        self.hint = hint
        self.icon = icon
        self.type = type
        self.keyboardType = keyboardType
        self.isSecure = isSecure
        self.value = value
        self.validation = validation
    }

    public func validate() {
        if let validation = validation {
            self.error = validation(value)
        } else {
            self.error = nil
        }
    }
}
